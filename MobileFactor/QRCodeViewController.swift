//
//  QRCodeViewController.swift
//  QRCodeReader
//
//  Created by Dario Castellano on 05/03/17.
//  Copyright © 2017 Dario Castellano. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var overlay: UIView!
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrView?.frame = CGRect.zero
            statusLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            _ = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            //qrView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue.hasPrefix("mf_")
            {
                let challenge = metadataObj.stringValue.substring(from: metadataObj.stringValue.index(metadataObj.stringValue.startIndex, offsetBy: 3))
                
                //call api
                let todoEndpoint: String = "http://mobilefactor.shev.pro/bind_confirm.php?challenge=\(challenge)"
                guard let url = URL(string: todoEndpoint) else {
                    print("Error: cannot create URL")
                    return
                }
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                let http_body = "key=chiave&email=dario&token=ashfbjv".data(using: String.Encoding.utf8)
                
                urlRequest.httpBody = http_body
                
                let session = URLSession.shared
                let task = session.dataTask(with: urlRequest, completionHandler:{ _, _, _ in })
                task.resume()
                
                statusLabel.text = "Pairing Completed!"
            }
            else {
                statusLabel.text = "QR Code not valid!"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overlay.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            qrView.layer.addSublayer(videoPreviewLayer!)
        
            
            // Start video capture.
            captureSession?.startRunning()
            statusLabel.text = "Scanning for QR code..."
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

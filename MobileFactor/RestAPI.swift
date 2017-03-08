//
//  RestAPI.swift
//  QRCodeReader
//
//  Created by Dario Castellano on 07/03/17.
//  Copyright © 2017 Dario Castellano. All rights reserved.
//

import Foundation

class RestAPI {
    static func bind(challenge: String, key: String, email: String, token: String) {
        let todoEndpoint: String = "http://mobilefactor.shev.pro/bind_confirm.php?challenge=\(challenge)"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let http_body = "key=\(key)&email=\(email)&token=\(token)".data(using: String.Encoding.utf8)
        
        urlRequest.httpBody = http_body
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler:{ _, _, _ in })
        task.resume()
    }
    
    static func deliverCredentials(challenge: String, token: String, formData: [(String, String)], completition: @escaping (Data?, URLResponse?, Error?) -> Void){
        let todoEndpoint: String = "http://mobilefactor.shev.pro/deliver_credential.php?challenge=\(challenge)&token=\(token)"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        var body = "";
        for tuple in formData {
            body += "\(tuple.0)=\(tuple.1)&"
        }
        
        print(body)
        let http_body = body.data(using: String.Encoding.utf8)
        
        urlRequest.httpBody = http_body
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler:completition)
        task.resume()
    }
    
    
    static func revokeCredentials(challenge: String, token: String){
        let todoEndpoint: String = "http://mobilefactor.shev.pro/deliver_credential.php?challenge=\(challenge)&token=\(token)&deny=true"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler:{ _, _, _ in })
        task.resume()
        
    }
    
}

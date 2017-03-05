var challenge = "";
var currentTab = "";
chrome.storage.sync.get("pk", function (strg) {
  if("pk" in strg){
    challenge = strg.pk.challenge;
    chrome.browserAction.setIcon({path: "icon-in.png"});
  }
});

chrome.runtime.onMessage.addListener (
  function (request, sender, sendResponse) {
    if (request.Message == "requestDomain") {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "http://mobilefactor.shev.pro/check_credential.php?challenge="+challenge+"&domain="+request.Domain, true);
        xhr.onload = function (e) {
          if (xhr.readyState === 4) {
            if (xhr.status === 200) {
              chrome.browserAction.setIcon({path: "icon-ready.png"});
              currentTab=request.Domain;
            }else{
              chrome.browserAction.setIcon({path: "icon-in.png"});
              currentTab="";
            }
          }
        };
      xhr.send(null);
    }
    if (request.Message == "hasPassword") {
      if(currentTab.length > 0){
        sendResponse({credential: true, domain: currentTab});
      }else{
        sendResponse({credential: false});
      }
    }

    if (request.Message == "update") {
      chrome.storage.sync.get("pk", function (strg) {
        if("pk" in strg){
          challenge = strg.pk.challenge;
          chrome.browserAction.setIcon({path: "icon-in.png"});
        }
      });
    }
  });

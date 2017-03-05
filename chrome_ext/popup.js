var challenge = "";
var domain = "";

function randomPassword(length) {
    var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOP1234567890";
    var pass = "";
    for (var x = 0; x < length; x++) {
        var i = Math.floor(Math.random() * chars.length);
        pass += chars.charAt(i);
    }
    return "pass";
}

function logout(){
  chrome.storage.sync.clear();
  window.close();
}

function login(){
  showView("passwordRequest");
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "http://mobilefactor.shev.pro/request_credential.php?challenge="+challenge+"&domain="+domain, true);
  xhr.onload = function (e) {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
          obj = JSON.parse(xhr.responseText);
          token = obj.token;
          startLoginPolling(token);
      }
    }
  }

  xhr.send(null);

}

function showView(view){
  var viewList = ["bind", "inside", "compileData", "passwordRequest"];
  viewList.forEach(function(entry) {
    document.getElementById(entry).style.display = 'none';
  });
  document.getElementById(view).style.display = 'block';
}

document.addEventListener('DOMContentLoaded', function () {
  chrome.storage.sync.get("pk", function (strg) {
    if("pk" in strg){
      showView("inside");
      challenge=strg.pk.challenge;
      console.log(strg);
      document.getElementById("email").innerHTML = strg.pk.email;
      document.getElementById("logoutBtn").addEventListener("click", logout);
    }else{
      showView("bind");
      setTimeout(loadQRCode, 500);
    }
  });

  chrome.runtime.sendMessage({Message: "hasPassword"}, function (response) {
    if(response.credential){
      showView("compileData");
      domain = response.domain;
      document.getElementById("domain").innerHTML = domain;
      document.getElementById("requestLogin").addEventListener("click", login);
    }
  })
});

async function loadQRCode(){
  var imgSrc="http://chart.apis.google.com/chart?cht=qr&chs=300x300&chld=H|0&chl=";
  var myChallenge = randomPassword(128);
  console.log("Challenge: " + myChallenge)

  var xhr = new XMLHttpRequest();
  xhr.open("GET", "http://mobilefactor.shev.pro/bind_browser.php?challenge="+myChallenge, true);
  xhr.onload = function (e) {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        document.getElementById("qrcode").src = imgSrc+myChallenge;
        startBindPolling(myChallenge)
      }
    }
  };
  xhr.send(null);
}

function startBindPolling(myChallenge){
  var x = setInterval(function() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://mobilefactor.shev.pro/verify_bind.php?challenge="+myChallenge, true);
    xhr.onload = function (e) {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          challenge=myChallenge;
          obj = JSON.parse(xhr.responseText);
          document.getElementById("title").innerHTML = "Pairing completed";
          document.getElementById("secondLlv").innerHTML = ""
          document.getElementById("hint").innerHTML = ""
          document.getElementById("qrcode").src = "success.png"
          chrome.storage.sync.set({'pk': obj});
          chrome.runtime.sendMessage({Message: "update"});
          clearInterval(x);

          setTimeout(function(){
            window.close();
          }, 1200);
        }
      }
    };
    xhr.send(null);
  }, 1000);
}

function startLoginPolling(token){
  var x = setInterval(function() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://mobilefactor.shev.pro/verify_credential.php?challenge="+challenge+"&token="+token, true);
    xhr.onload = function (e) {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          clearInterval(x);
          credentials = (JSON.parse(xhr.responseText)).data;
          console.log(credentials);
          Object.keys(credentials).forEach(function(entry) {
            console.log("document.getElementsByName(" + entry + ")[0].value="+credentials[entry]+";");
            chrome.tabs.executeScript(null, {code:"document.getElementsByName('" + entry + "')[0].value='"+credentials[entry]+"';"});
            //document.getElementsByName(entry)[0].value=credentials[entry];
            //document.getElementsByName('login')[0].value
            window.close();
          });

        }
      }
    };
    xhr.send(null);
  }, 1000);
}

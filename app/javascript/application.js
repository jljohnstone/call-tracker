// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//register service worker
let swRegistration = null;
if ("serviceWorker" in navigator && "PushManager" in window) {
  // console.log("Service Worker and Push is supported");
  navigator.serviceWorker
  .register("/service-worker.js")
  .then(swReg => {
      // console.log("Service Worker is registered", swReg);
      swRegistration = swReg;
    })
    .catch(error => {
      console.error("Service Worker Error", error);
    });
  } else {
    console.warn("Push messaging is not supported");
  }

//find enable notifications button
const enableNotificationsButton = document.getElementById("enablenotifications") || null;

//if the notifications button is found
let permissionToSend = null;
if (enableNotificationsButton) {
  enableNotificationsButton.addEventListener("click", (event) => {
    // console.log(event);
    requestNotificationsPermission();
  })
}

//find send show notification button
const displayNotificationButton = document.getElementById("testnotification") || null;

//if the notifications button is found
if (displayNotificationButton) {
  displayNotificationButton.addEventListener("click", (event) => {
    // console.log(event);
    // console.log("permissionToSend:", permissionToSend)
    if (permissionToSend === "granted") {
      displayNotification();
    }
    else {
      // console.log('permission not granted')
    }
  })
}

//request permission
function requestNotificationsPermission() {
  if (window.Notification) {
    // console.log('requesting permission to send notifications')
    Notification.requestPermission(reply => {
      permissionToSend = reply
      // console.log("reply:", reply)
    });
  }
}

//display notification
function displayNotification() {
  const options = {
    body: "Testing Our Notification",
    icon: "/favicon-32x32.png"
  };
  swRegistration.showNotification("PWA Notification!", options);
}


// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// if ("serviceWorker" in navigator) {
//   window.addEventListener("load", function() {
//     this.navigator.serviceWorker.register("/service-worker.js", { scope: "/" } )
//   })
// }

// const button = document.getElementById("notifications")
// button.addEventListener("click", () => {
  Notification.requestPermission().then((result) => {
    if (result === "granted") {
      console.log("notification permission granted")
      testNotification()
    }
  })
// })

function testNotification() {
  console.log("sending notification...")
  new Notification("Notification Title", { body: "This is the body.", icon: "android-icon-192x192.png"})
  console.log("...notifcation sent")
  setTimeout(testNotification, 30000)
}

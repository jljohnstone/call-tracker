// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// if ("serviceWorker" in navigator) {
//   window.addEventListener("load", function() {
//     this.navigator.serviceWorker.register("/service-worker.js", { scope: "/" } )
//   })
// }

// const registerServiceWorker = async () => {
//   if ("serviceWorker" in navigator) {
//     try {
//       const registration = await navigator.serviceWorker.register("/service-worker.js", {
//         scope: "/",
//       });
//       if (registration.installing) {
//         console.log("Service worker installing")
//       } else if (registration.waiting) {
//         console.log("Service worker installed")
//       } else if (registration.active) {
//         console.log("Service worker active")
//       }
//     } catch (error) {
//       console.error(`Registration failed with ${error}`)
//     }
//   }
// }

// registerServiceWorker()

const getNotificationsBtn = document.getElementById("get-notifications")
getNotificationsBtn.addEventListener("click", () => {
  Notification.requestPermission().then((result) => {
    if (result === "granted") {
      console.log("notification permission granted")
      testNotification()
    }
  })
})


function testNotification() {
  console.log("sending notification...")
  new Notification("Notification Title", { body: "This is the body.", icon: "android-icon-192x192.png"})
  console.log("...notifcation sent")
  // setTimeout(testNotification, 30000)
}

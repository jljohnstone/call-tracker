// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

if ("serviceWorker" in navigator) {
  window.addEventListener("load", function() {
    this.navigator.serviceWorker.register("/service-worker.js", { scope: "/" } )
  })
}

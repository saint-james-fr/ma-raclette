import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-sidebar"
export default class extends Controller {
  connect() {
    console.log("hello")
  }

  activeRaclette() {
    const raclette = document.getElementById("dashboard_raclettes")
    const bookings = document.getElementById("dashboard_bookings")
    raclette.classList.add("display")
    bookings.classList.remove("display")
    bookings.classList.add("display-none")
  }

  activeBookings() {
    const raclette = document.getElementById("dashboard_raclettes")
    const bookings = document.getElementById("dashboard_bookings")
    bookings.classList.add("display")
    raclette.classList.remove("display")
    raclette.classList.add("display-none")
  }
}

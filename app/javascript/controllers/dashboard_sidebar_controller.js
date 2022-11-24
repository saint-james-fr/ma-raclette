import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-sidebar"
export default class extends Controller {
  connect() {
    console.log("hello")
  }

  activeRaclette() {
    const raclette = document.getElementById("dashboard_raclettes")
    const bookings = document.getElementById("dashboard_bookings")
    const profile = document.getElementById("dashboard_profile")
    raclette.classList.add("display")
    bookings.classList.remove("display")
    profile.classList.remove("display")
    bookings.classList.add("display-none")
    profile.classList.add("display-none")
  }

  activeBookings() {
    const raclette = document.getElementById("dashboard_raclettes")
    const bookings = document.getElementById("dashboard_bookings")
    const profile = document.getElementById("dashboard_profile")
    bookings.classList.add("display")
    raclette.classList.remove("display")
    profile.classList.remove("display")
    raclette.classList.add("display-none")
    profile.classList.add("display-none")
  }

  activeProfile() {
    const raclette = document.getElementById("dashboard_raclettes")
    const bookings = document.getElementById("dashboard_bookings")
    const profile = document.getElementById("dashboard_profile")
    profile.classList.add("display")
    bookings.classList.remove("display")
    raclette.classList.remove("display")
    bookings.classList.add("display-none")
    raclette.classList.add("display-none")
  }
}

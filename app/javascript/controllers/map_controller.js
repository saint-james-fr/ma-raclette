import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }
    connect() {
      mapboxgl.accessToken = this.apiKeyValue

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10"
      })
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
      this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl }))
      this.#openInfoWindow()
    }


    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
        const customMarker = document.createElement("div")
        customMarker.className = "marker"
        customMarker.style.backgroundImage = `url('${marker.image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.width = "25px"
        customMarker.style.height = "25px"
        const newMarker = new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)

        // newMarker.getElement().dataset.markerId = marker.id;
        // newMarker.getElement().addEventListener('click', (e) => this.#toggleCardHighlighting(e) );
        // newMarker.getElement().addEventListener('click', (e) => this.#toggleCardHighlighting(e) );
        // console.log(newMarker)

//
      })
    }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

    #openInfoWindow(){
      // Select all cards
      const cards = document.querySelectorAll('.card-grid-index');
      cards.forEach((card, index) => {
        const popup = new mapboxgl.Popup().setHTML(this.markersValue[index].infoWindow)
        const customMarker = document.createElement("div")
        customMarker.className = "marker"
        customMarker.style.backgroundImage = `url('${this.markersValue[index].image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.width = "25px"
        customMarker.style.height = "25px"
        const marker = new mapboxgl.Marker(customMarker)
        .setLngLat([ this.markersValue[index].lng, this.markersValue[index].lat ])
        .setPopup(popup)
        .addTo(this.map)

        // Put a microphone on each card listening for a mouseenter event
        card.addEventListener('mouseenter', () => {
          // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
          marker.togglePopup();
        });
        // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
        card.addEventListener('mouseleave', () => {
        marker.togglePopup();
          });
      });
    }

    // #toggleCardHighlighting(){
    //   // We select the card corresponding to the marker's id
    //   const markers = document.querySelectorAll(".mapboxgl-marker")
    //   console.log(markers)
    //   markers.forEach((marker) => {
    //     marker.addEventListener(click, (event) => {

    //       // Do something (callback)
    //     });

    //   })
    //   const card = document.querySelector(`[data-raclette-id="${event.currentTarget.dataset.markerId}"]`);
    //   console.log(card)
    //   // Then we toggle the class "highlight github" to the card
    //   card.classList.toggle('highlight');
    // }

    // #toggleCardHighlighting(e){
    //   // We select the card corresponding to the marker's id
    //   const card = document.querySelector(`[data-raclette-id="${event.currentTarget.dataset.markerId}"]`);
    //   // Then we toggle the class "highlight github" to the card
    //   console.log(card)
    //   card.classList.toggle('highlight');
    // }


}

import { Controller } from "@hotwired/stimulus"
import { Loader } from "@googlemaps/js-api-loader";
// import { container } from "webpack";

// Connects to data-controller="map"
export default class extends Controller {
  static values = { api: String, markers: Array }
  
  static targets = ["map"]

  connect() {
    console.log("Listing Map connected");
    console.log(this.mapTarget);
    console.log(this.apiValue);
    
    const loader = new Loader({
      apiKey: this.apiValue,
      version: "weekly",
      libraries: ["places"],
    });

    loader.load().then(() => {
      this.initMap();
    });
  }

  initMap() {
    console.log("init Map function is working");
    var map = new google.maps.Map(this.mapTarget, {
      zoom: 5,
      // Put the current User Location
      center: this.markersValue[0]
    });

    this.markersValue.map(m => {
      const marker = new google.maps.Marker({
        position: m,
        map: map,
      });
    });
  }
}

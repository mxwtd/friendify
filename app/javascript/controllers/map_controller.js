import { Controller } from "@hotwired/stimulus"
import { Loader } from "@googlemaps/js-api-loader";
import { container } from "webpack";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"]
  static values = { apiKey: String }

  connect() {
    console.log("Listing Map connecteed!");
    console.log(this.mapTarget);

    // const loader = new Loader({
    //   apiKey: "AIzaSyDeFR90LQKYXflRcL-SMRQCsQrXIH6EvsY",
    //   // apiKey: "<%=ENV['GOOGLE_MAPS_API']%>",
    //   version: "weekly",
    //   libraries: ["places"],
    // });

    // loader.load().then(() => {
    //   this.initMap();
    // });
    this.initMap();
  }

  initMap() {
    // Call the initMap function here
    console.log(this.apiKeyValue);
    console.log("init Map function is working");
    let uluru = {lat: -25.344, lng: 132.036};
    let map = new google.maps.Map(
      this.mapTarget,
      {zoom: 4, center: uluru}
    )
  }
}

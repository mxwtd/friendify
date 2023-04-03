import { Controller } from "@hotwired/stimulus"
// import { Loader } from "@googlemaps/js-api-loader";

// Connects to data-controller="listing-map"
export default class extends Controller {
  connect() {
    console.log("Listing Map connecteeeeed!!!");

    // const loader = new Loader({
    //   apiKey: "<%=ENV['GOOGLE_MAPS_API']%>",
    //   version: "weekly",
    //   libraries: ["places"],
    // });

    // loader.load().then(() => {
    //   this.initMap();
    // });
  }

  initMap() {
    // Call the initMap function here
    console.log("init Map function is working");
  }
}

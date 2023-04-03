import { Application } from "@hotwired/stimulus"
import GoogleMapsController from "./controllers/google_maps_controller";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

const context = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
application.register("google-maps", GoogleMapsController);

console.log("Change this!");

export { application }

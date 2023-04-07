import { Application } from "@hotwired/stimulus"
// import GoogleMapsController from "./controllers/map_controller";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// const context = require.context("./controllers", true, /\.js$/);
// application.load(definitionsFromContext(context));
// application.register("map", GoogleMapsController);

// console.log("Change thisss!");

export { application }

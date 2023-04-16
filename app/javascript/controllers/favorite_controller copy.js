import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["button"];
  like(e) {
    console.log(e.target);
  }
}

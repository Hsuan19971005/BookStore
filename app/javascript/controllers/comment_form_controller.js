import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"];
  input(e) {
    const content = e.target.value.trim();
    if (content != "") {
      this.buttonTarget.removeAttribute("disabled");
    } else {
      this.buttonTarget.setAttribute("disabled", "");
    }
  }
}

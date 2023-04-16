import {Controller} from "@hotwired/stimulus";
import {get, post, put, patch, destroy} from "@rails/request.js";

export default class extends Controller {
  static targets = ["icon"];
  initialize() {
    this.isLike = false;
    this.resume = undefined;
  }
  connect() {
    this.element.setAttribute("data-action", "click->favorite#like");
  }
  like() {
    let url = "/resumes/${this.resumeId}/like";
    post(url, {body: JSON.stringify({name: "hello!!!"})}).then((resp) => {
      console.log(resp);
    });
    // const response = await post('localhost:3000/my_endpoint', )
    // if (response.ok) {
    // }

    if (this.isLike == false) {
      this.iconTarget.classList.remove("fa-regular");
      this.iconTarget.classList.add("fa-solid");
      this.isLike = true;
      // 打API
    } else {
      this.iconTarget.classList.remove("fa-solid");
      this.iconTarget.classList.add("fa-regular");
      this.isLike = false;
      // 打API
    }
  }
}

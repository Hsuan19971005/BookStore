import {Controller} from "@hotwired/stimulus";
import {get, post, put, patch, destroy} from "@rails/request.js";

export default class extends Controller {
  static targets = ["icon"];
  connect() {
    this.element.setAttribute("data-action", "click->favorite#like");
    const {id, liked} = this.element.dataset;
    this.isLike = liked == "true" ? true : false;
    this.bookID = id;
    this.updateIcon();
  }
  updateIcon() {
    if (this.isLike == false) {
      this.iconTarget.classList.remove("fa-solid");
      this.iconTarget.classList.add("fa-regular");
    } else {
      this.iconTarget.classList.remove("fa-regular");
      this.iconTarget.classList.add("fa-solid");
    }
  }
  async like() {
    this.isLike = !this.isLike;
    this.updateIcon();
    // 打API
    let url = `/api/v1/books/${this.bookID}/like`;
    const resp = await post(url, {
      body: JSON.stringify({name: "hello!!!"}),
    });
    if (resp.ok) {
      console.log(resp);
    } else {
      console.log("no return!");
    }
  }
}

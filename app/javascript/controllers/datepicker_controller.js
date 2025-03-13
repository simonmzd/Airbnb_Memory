import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      allowInput: true,
      minDate: "0000-01-01",
      maxDate: "2025-12-31",
      yearSelectorType: "scroll"
    });
  }
}

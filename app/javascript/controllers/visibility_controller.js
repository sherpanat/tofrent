import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["invisible", "visible"]

  switch() {
    this.invisibleTargets.forEach((target) => target.classList.remove('d-none'));
    this.visibleTargets.forEach((target) => target.classList.add('d-none'));
  }
}

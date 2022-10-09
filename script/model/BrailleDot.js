class Dot {
  constructor(state_, dotSize_) {
    this.state = state_;
    this.size = dotSize_;
  }

  display() {
    // colors
    noStroke();
    fill(50);

    if (this.state == 0) {
      noFill();
    }

    push();
    translate(0, 0, -this.size / 4);
    sphere(this.size / 2);
    pop();
  }

  newState(state_) {
    this.state = state_;
  }
}

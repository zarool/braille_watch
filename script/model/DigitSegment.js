class Segment {
  constructor(state_, isMiddle_, segmentW_, segmentH_) {
    this.state = state_;
    this.isMiddle = isMiddle_;
    this.segmentW = segmentW_;
    this.segmentH = segmentH_;
  }

  display() {
    // colors
    noStroke();
    fill(245, 20, 20, 200);
    if (this.state == 0) {
      noFill();

      // show disabled segments
      //stroke(180, 10);
    }

    if (this.isMiddle) {
      triangle(
        -this.segmentW / 2,
        this.segmentH / 2,
        -(this.segmentW / 2 + this.segmentH),
        0,
        -this.segmentW / 2,
        -this.segmentH / 2
      );
      triangle(
        this.segmentW / 2,
        this.segmentH / 2,
        this.segmentW / 2 + this.segmentH,
        0,
        this.segmentW / 2,
        -this.segmentH / 2
      );
    } else {
      triangle(
        -this.segmentW / 2,
        this.segmentH / 2,
        -(this.segmentW / 2 + (this.segmentH * 2) / 5),
        -this.segmentH / 2,
        -this.segmentW / 2,
        -this.segmentH / 2
      );
      triangle(
        this.segmentW / 2,
        this.segmentH / 2,
        this.segmentW / 2 + (this.segmentH * 2) / 5,
        -this.segmentH / 2,
        this.segmentW / 2,
        -this.segmentH / 2
      );
    }

    rect(0, 0, this.segmentW, this.segmentH);
  }

  newState(state_) {
    this.state = state_;
  }
}

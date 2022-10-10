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
    if (this.state == 0) {
      noFill();
    } else {
      fill(250, 15, 20, 200);
    }

    // main body
    beginShape();
    vertex(-this.segmentW / 2, -this.segmentH / 2);
    vertex(-this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, -this.segmentH / 2);
    endShape(CLOSE);

    // middle triangles
    if (this.isMiddle) {
      beginShape();
      vertex(-this.segmentW / 2, this.segmentH / 2);
      vertex(-(this.segmentW / 2 + this.segmentH), 0);
      vertex(-this.segmentW / 2, -this.segmentH / 2);
      endShape();

      beginShape();
      vertex(this.segmentW / 2, this.segmentH / 2);
      vertex(this.segmentW / 2 + this.segmentH, 0);
      vertex(this.segmentW / 2, -this.segmentH / 2);
      endShape();
    } else {
      // other triangles

      beginShape();
      vertex(-this.segmentW / 2, this.segmentH / 2);
      vertex(
        -(this.segmentW / 2 + (this.segmentH * 2) / 5),
        -this.segmentH / 2
      );
      vertex(-this.segmentW / 2, -this.segmentH / 2);
      endShape();

      beginShape();
      vertex(this.segmentW / 2, this.segmentH / 2);
      vertex(this.segmentW / 2 + (this.segmentH * 2) / 5, -this.segmentH / 2);
      vertex(this.segmentW / 2, -this.segmentH / 2);
      endShape();
    }
  }

  newState(state_) {
    this.state = state_;
  }
}

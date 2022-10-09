class Digit {
  constructor(x_, y_, number_, segmentW_, segmentH_) {
    this.pos = createVector(x_, y_);

    this.numbers = [0x7e, 0x30, 0x6d, 0x79, 0x33, 0x5b, 0x5f, 0x70, 0x7f, 0x7b];

    this.segments_length = 7;
    this.segments = [];

    this.segmentW = segmentW_;
    this.segmentH = segmentH_;

    this.number = number_;
    this.segmentNumber = this.numbers[number_];

    for (let i = 0; i < this.segments_length - 1; i++) {
      this.segments.push(new Segment(0, false, this.segmentW, this.segmentH));
    }
    this.segments[this.segments_length - 1] = new Segment(
      0,
      true,
      this.segmentW,
      this.segmentH
    );
  }

  display() {
    push();
    translate(this.pos.x, this.pos.y);

    // 0A - top middle
    push();
    translate(0, -1 * (this.segmentW + this.segmentH + offset));
    this.segments[0].newState((this.segmentNumber >> 6) & 1);
    this.segments[0].display();
    pop();

    // 1B - top right
    push();
    translate(
      this.segmentW / 2 + this.segmentH / 2 + offset,
      -1 * (this.segmentW / 2 + this.segmentH / 2)
    );
    rotate(PI / 2);
    this.segments[1].newState((this.segmentNumber >> 5) & 1);
    this.segments[1].display();
    pop();

    // 2C - bottom right
    push();
    translate(
      this.segmentW / 2 + this.segmentH / 2 + offset,
      this.segmentW / 2 + this.segmentH / 2
    );
    rotate(PI / 2);
    this.segments[2].newState((this.segmentNumber >> 4) & 1);
    this.segments[2].display();
    pop();

    // 3D - bottom middle
    push();
    translate(0, this.segmentW + this.segmentH + offset);
    rotate(PI);
    this.segments[3].newState((this.segmentNumber >> 3) & 1);
    this.segments[3].display();
    pop();

    // 4E - bottom left
    push();
    translate(
      -1 * (this.segmentW / 2 + this.segmentH / 2 + offset),
      this.segmentW / 2 + this.segmentH / 2
    );
    rotate(-PI / 2);
    this.segments[4].newState((this.segmentNumber >> 2) & 1);
    this.segments[4].display();
    pop();

    // 5F - top left
    push();
    translate(
      -1 * (this.segmentW / 2 + this.segmentH / 2 + offset),
      -1 * (this.segmentW / 2 + this.segmentH / 2)
    );
    rotate(-PI / 2);
    this.segments[5].newState((this.segmentNumber >> 1) & 1);
    this.segments[5].display();
    pop();

    // 6G - center
    push();
    this.segments[6].newState((this.segmentNumber >> 0) & 1);
    this.segments[6].display();
    pop();

    pop();
  }

  update(number_) {
    this.number = number_;
    this.segmentNumber = this.numbers[number_];
  }
}

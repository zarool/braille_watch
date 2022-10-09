class Braille {
  constructor(x_, y_, dotSize_, number_) {
    this.pos = createVector(x_, y_);
    this.size = dotSize_ * 0.5;
    this.margin = dotSize_ * 0.4;

    this.dots_length = 4;
    this.dots = [];
    this.numbers = [0x7, 0x8, 0xa, 0xc, 0xd, 0x9, 0xe, 0xf, 0xb, 0x6];

    this.number = number_;
    this.dot = this.numbers[this.number];

    for (let index = 0; index < this.dots_length; index++) {
      this.dots.push(new Dot(0, this.size));
    }
  }

  display() {
    push();
    translate(this.pos.x, this.pos.y);

    // upper left
    push();
    translate(-this.margin, -this.margin);
    this.dots[0].newState((this.dot >> 3) & 1);
    this.dots[0].display();
    pop();

    // upper right
    push();
    translate(this.margin, -this.margin);
    this.dots[1].newState((this.dot >> 2) & 1);
    this.dots[1].display();
    pop();

    // bottom left
    push();
    translate(-this.margin, this.margin);
    this.dots[2].newState((this.dot >> 1) & 1);
    this.dots[2].display();
    pop();

    // bottom right
    push();
    translate(this.margin, this.margin);
    this.dots[3].newState((this.dot >> 0) & 1);
    this.dots[3].display();
    pop();

    pop();
  }

  update(number_) {
    this.number = number_;
    this.dot = this.numbers[this.number];

    for (let index = 0; index < this.dots.length; index++) {
      this.dots[index].newState(0);
    }
  }
}

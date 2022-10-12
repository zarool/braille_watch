class Braille {
  PVector pos = new PVector();

  Dot[] dots = new Dot[4];
  int[] numbers = {0x7, 0x8, 0xA, 0xC, 0xD, 0x9, 0xE, 0xF, 0xB, 0x6};
  int number;
  int dot;
  
  // size of dot
  float size;
  
  // distance beetwen dots
  float margin;

  Braille(float x_, float y_, float dotSize_, int number_) {
    pos.x = x_;
    pos.y = y_;
    size = dotSize_ * 0.5;
    margin = dotSize_ * 0.4;

    number = number_;
    dot = numbers[number];

    for (int index = 0; index < dots.length; index++) {
      dots[index] = new Dot(0, size);
    }
  }

  void display() {
    push();
    translate(pos.x, pos.y);

    // upper left
    push();
    translate(-margin, -margin);
    dots[0].newState((dot >> 3) & 1);
    dots[0].display();
    pop();

    // upper right
    push();
    translate(margin, -margin);
    dots[1].newState((dot >> 2) & 1);
    dots[1].display();
    pop();

    // bottom left
    push();
    translate(-margin, margin);
    dots[2].newState((dot >> 1) & 1);
    dots[2].display();
    pop();


    // bottom right
    push();
    translate(margin, margin);
    dots[3].newState((dot >> 0) & 1);
    dots[3].display();
    pop();

    pop();
  }

  void update(int number_) {
    number = number_;
    dot = numbers[number];

    for (int index = 0; index < dots.length; index++) {
      dots[index].newState(0);
    }
  }
}

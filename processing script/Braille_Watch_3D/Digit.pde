class Digit {
  PVector pos = new PVector();

  int[] numbers = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
  int number;
  int segmentNumber;

  Segment[] segments = new Segment[7];
  
  // segment width and height
  float segmentW, segmentH;


  Digit(float x, float y, int number_, float segmentW_, float segmentH_) {
    pos.x = x;
    pos.y = y;

    segmentW = segmentW_;
    segmentH = segmentH_;

    number = number_;
    segmentNumber = numbers[number_];

    for (int i = 0; i < segments.length - 1; i++) {
      segments[i] = new Segment(0, false, segmentW, segmentH);
    }
    segments[segments.length - 1] = new Segment(0, true, segmentW, segmentH);
  }

  void display() {
    push();
    translate(pos.x, pos.y);

    // 0A - top middle
    push();
    translate(0, -1 * (segmentW + segmentH + offset));
    segments[0].newState((segmentNumber >> 6) & 1);
    segments[0].display();
    pop();

    // 1B - top right
    push();
    translate((segmentW/2 + segmentH/2 + offset), -1 * (segmentW/2 + segmentH/2));
    rotate(PI / 2);
    segments[1].newState((segmentNumber >> 5) & 1);
    segments[1].display();
    pop();

    // 2C - bottom right
    push();
    translate((segmentW/2 + segmentH/2 + offset), (segmentW/2 + segmentH/2));
    rotate(PI / 2);
    segments[2].newState((segmentNumber >> 4) & 1);
    segments[2].display();
    pop();

    // 3D - bottom middle
    push();
    translate(0, segmentW + segmentH  + offset);
    rotate(PI);
    segments[3].newState((segmentNumber >> 3) & 1);
    segments[3].display();
    pop();

    // 4E - bottom left
    push();
    translate(-1 * (segmentW/2 + segmentH/2 + offset), (segmentW/2 + segmentH/2));
    rotate(- PI / 2);
    segments[4].newState((segmentNumber >> 2) & 1);
    segments[4].display();
    pop();

    // 5F - top left
    push();
    translate(-1 * (segmentW/2 + segmentH/2 + offset), -1 * (segmentW/2 + segmentH/2));
    rotate(- PI / 2);
    segments[5].newState((segmentNumber >> 1) & 1);
    segments[5].display();
    pop();

    // 6G - center
    push();
    segments[6].newState((segmentNumber >> 0) & 1);
    segments[6].display();
    pop();

    pop();
  }

  void update(int number_) {
    number = number_;
    segmentNumber = numbers[number];
  }
}

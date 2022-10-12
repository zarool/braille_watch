class Segment {
  int state;
  boolean isMiddle;

  float segmentW, segmentH;

  Segment(int state_, boolean isMiddle_, float segmentW_, float segmentH_) {
    this.state = state_;
    this.isMiddle = isMiddle_;
    this.segmentW = segmentW_;
    this.segmentH = segmentH_;
  }

  void display() {
    noStroke();
    fill(245, 20, 20, 180);
    if (state == 0) {
      noFill();

      // show disabled segments
      //stroke(180, 10);
    }

    if (isMiddle) {
      triangle(-segmentW/2, segmentH/2, -(segmentW/2 + segmentH), 0, -segmentW/2, -segmentH/2);
      triangle(segmentW/2, segmentH/2, (segmentW/2 + segmentH), 0, segmentW/2, -segmentH/2);
    } else {
      triangle(-segmentW/2, segmentH/2, -(segmentW/2 + (segmentH * 2/5)), -segmentH/2, -segmentW/2, -segmentH/2);
      triangle(segmentW/2, segmentH/2, (segmentW/2 + (segmentH * 2/5)), -segmentH/2, segmentW/2, -segmentH/2);
    }

    rect(0, 0, segmentW, segmentH);
  }

  void newState(int state_) {
    state = state_;
  }
}

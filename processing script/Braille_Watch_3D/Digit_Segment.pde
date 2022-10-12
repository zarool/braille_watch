<<<<<<< HEAD
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

    // colors
    noStroke();
    if (this.state == 0) {
      noFill();
    } else {
      fill(250, 15, 20, 200);
    }

    beginShape();
    vertex(-this.segmentW / 2, -this.segmentH / 2);
    vertex(-this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, -this.segmentH / 2);
    endShape(CLOSE);

    if (isMiddle) {
      //triangle(-segmentW/2, segmentH/2, -(segmentW/2 + segmentH), 0, -segmentW/2, -segmentH/2);
      //triangle(segmentW/2, segmentH/2, (segmentW/2 + segmentH), 0, segmentW/2, -segmentH/2);

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
      //triangle(-segmentW/2, segmentH/2, -(segmentW/2 + (segmentH * 2/5)), -segmentH/2, -segmentW/2, -segmentH/2);
      //triangle(segmentW/2, segmentH/2, (segmentW/2 + (segmentH * 2/5)), -segmentH/2, segmentW/2, -segmentH/2);

      beginShape();
      vertex(-this.segmentW / 2, this.segmentH / 2);
      vertex(-(this.segmentW / 2 + (this.segmentH * 2) / 5), -this.segmentH / 2);
      vertex(-this.segmentW / 2, -this.segmentH / 2);
      endShape();

      beginShape();
      vertex(this.segmentW / 2, this.segmentH / 2);
      vertex(this.segmentW / 2 + (this.segmentH * 2) / 5, -this.segmentH / 2);
      vertex(this.segmentW / 2, -this.segmentH / 2);
      endShape();
    }

    //rect(0, 0, segmentW, segmentH);
  }

  void newState(int state_) {
    state = state_;
  }
}
=======
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

    // colors
    noStroke();
    if (this.state == 0) {
      noFill();
    } else {
      fill(250, 15, 20, 200);
    }

    beginShape();
    vertex(-this.segmentW / 2, -this.segmentH / 2);
    vertex(-this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, this.segmentH / 2);
    vertex(this.segmentW / 2, -this.segmentH / 2);
    endShape(CLOSE);

    if (isMiddle) {
      //triangle(-segmentW/2, segmentH/2, -(segmentW/2 + segmentH), 0, -segmentW/2, -segmentH/2);
      //triangle(segmentW/2, segmentH/2, (segmentW/2 + segmentH), 0, segmentW/2, -segmentH/2);

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
      //triangle(-segmentW/2, segmentH/2, -(segmentW/2 + (segmentH * 2/5)), -segmentH/2, -segmentW/2, -segmentH/2);
      //triangle(segmentW/2, segmentH/2, (segmentW/2 + (segmentH * 2/5)), -segmentH/2, segmentW/2, -segmentH/2);

      beginShape();
      vertex(-this.segmentW / 2, this.segmentH / 2);
      vertex(-(this.segmentW / 2 + (this.segmentH * 2) / 5), -this.segmentH / 2);
      vertex(-this.segmentW / 2, -this.segmentH / 2);
      endShape();

      beginShape();
      vertex(this.segmentW / 2, this.segmentH / 2);
      vertex(this.segmentW / 2 + (this.segmentH * 2) / 5, -this.segmentH / 2);
      vertex(this.segmentW / 2, -this.segmentH / 2);
      endShape();
    }

    //rect(0, 0, segmentW, segmentH);
  }

  void newState(int state_) {
    state = state_;
  }
}
>>>>>>> 4e2fa3d40068777bb1c099f3829a30abfdb00112

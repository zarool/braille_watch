<<<<<<< HEAD
class Dot {
  int state;
  float size;

  Dot(int state_, float dotSize_) {
    state = state_;
    size = dotSize_;
  }

  void display() {
    noStroke();
    fill(180, 200);
    if (state == 0) {
      noFill();
    }

    ellipse(0, 0, size, size);
  }

  void newState(int state_) {
    this.state = state_;
  }
}
=======
class Dot {
  int state;
  float size;

  Dot(int state_, float dotSize_) {
    state = state_;
    size = dotSize_;
  }

  void display() {
    noStroke();
    fill(180, 200);
    if (state == 0) {
      noFill();
    }

    ellipse(0, 0, size, size);
  }

  void newState(int state_) {
    this.state = state_;
  }
}
>>>>>>> 4e2fa3d40068777bb1c099f3829a30abfdb00112

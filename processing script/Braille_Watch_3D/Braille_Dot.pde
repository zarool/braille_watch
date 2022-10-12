class Dot {
  int state;
  float size;

  Dot(int state_, float dotSize_) {
    state = state_;
    size = dotSize_;
  }

  void display() {
    
    // colors
    noStroke();
    fill(50);
    
    if (state == 0) {
      noFill();
    }
    
    push();
    translate(0, 0, - size * 0.3);
    sphere(size/2);
    pop();
  }

  void newState(int state_) {
    this.state = state_;
  }
}

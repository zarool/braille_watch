class Box {

  float x, y, z;
  float w, h, d;

  Box(float x_, float y_, float z_, float w_, float h_, float d_) {
    x = x_;
    y = y_;
    z = z_;

    w = w_;
    h = h_;
    d = d_;
  }

  void display() {
    // 3D display of box, pretty ugly written but it does work, specific model will be made in blender
    // display only for website showcase

    push();
    translate(x, y, z);

    // colors
    fill(23);
    //noFill();
    stroke(0);

    // front
    beginShape();
    // bottom right
    vertex(w * 0.4, h * 0.5, 0);
    vertex(w * 0.5, h * 0.3, 0);
    // upper right
    vertex(w * 0.5, - h * 0.3, 0);
    vertex(w * 0.4, - h * 0.5, 0);
    // upper left
    vertex(- w * 0.4, - h * 0.5, 0);
    vertex(- w * 0.5, - h * 0.3, 0);
    // bottom left
    vertex(- w * 0.5, h * 0.3, 0);
    vertex(- w * 0.4, h * 0.5, 0);
    //connect
    vertex(w * 0.4, h * 0.5, 0);
    endShape();

    // back
    beginShape();
    // bottom right
    vertex(w * 0.4, h * 0.5, -d);
    vertex(w * 0.5, h * 0.3, -d);
    // upper right
    vertex(w * 0.5, - h * 0.3, -d);
    vertex(w * 0.4, - h * 0.5, -d);
    // upper left
    vertex(- w * 0.4, - h * 0.5, -d);
    vertex(- w * 0.5, - h * 0.3, -d);
    // bottom left
    vertex(- w * 0.5, h * 0.3, -d);
    vertex(- w * 0.4, h * 0.5, -d);
    // connect
    vertex(w * 0.4, h * 0.5, -d);
    endShape();

    // sides
    // top and bottom
    push();
    translate(0, -h/2, -d/2);
    rotateX(PI/2);
    rect(0, 0, w * 0.8, d);
    pop();

    push();
    translate(0, h/2, -d/2);
    rotateX(PI/2);
    rect(0, 0, w * 0.8, d);
    pop();

    // left and right
    push();
    translate(w/2, 0, -d/2);
    rotateX(PI/2);
    rotateY(PI/2);
    rect(0, 0, h * 0.6, d);
    pop();

    push();
    translate(-w/2, 0, -d/2);
    rotateX(PI/2);
    rotateY(PI/2);
    rect(0, 0, h * 0.6, d);
    pop();

    // corners
    // bottom right
    beginShape();
    vertex(w * 0.4, h * 0.5, 0);
    vertex(w * 0.5, h * 0.3, 0);
    vertex(w * 0.5, h * 0.3, -d);
    vertex(w * 0.4, h * 0.5, -d);
    endShape();

    // upper right
    beginShape();
    vertex(w * 0.5, - h * 0.3, 0);
    vertex(w * 0.4, - h * 0.5, 0);
    vertex(w * 0.4, - h * 0.5, -d);
    vertex(w * 0.5, - h * 0.3, -d);
    endShape();

    // upper left
    beginShape();
    vertex(- w * 0.4, - h * 0.5, 0);
    vertex(- w * 0.5, - h * 0.3, 0);
    vertex(- w * 0.5, - h * 0.3, -d);
    vertex(- w * 0.4, - h * 0.5, -d);
    endShape();

    // bottom left
    beginShape();
    vertex(- w * 0.5, h * 0.3, 0);
    vertex(- w * 0.4, h * 0.5, 0);
    vertex(- w * 0.4, h * 0.5, -d);
    vertex(- w * 0.5, h * 0.3, -d);
    endShape();


    sideDisplay(bH/2, 1, - PI/5);
    sideDisplay(bH/2, -1, PI/5);

    pop();
  }

  void sideDisplay(float pos, float sign, float angle) {
    push();
    translate(0, pos * sign, -d);
    rotateX(angle);

    fill(23);
    box(w * 0.7, h * 0.2, d);

    pop();
  }
}

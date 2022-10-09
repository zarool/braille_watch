class Body {
  constructor(x_, y_, z_, w_, h_, d_) {
    this.x = x_;
    this.y = y_;
    this.z = z_;

    this.w = w_;
    this.h = h_;
    this.d = d_;
  }

  display() {
    // 3D display of box, pretty ugly written but it does work, specific model will be made in blender
    // display only for website showcase

    push();
    translate(this.x, this.y, this.z);

    // colors
    fill(23);
    //noFill();
    stroke(0);

    // front
    beginShape();
    // bottom right
    vertex(this.w * 0.4, this.h * 0.5, 0);
    vertex(this.w * 0.5, this.h * 0.3, 0);
    // upper right
    vertex(this.w * 0.5, -this.h * 0.3, 0);
    vertex(this.w * 0.4, -this.h * 0.5, 0);
    // upper left
    vertex(-this.w * 0.4, -this.h * 0.5, 0);
    vertex(-this.w * 0.5, -this.h * 0.3, 0);
    // bottom left
    vertex(-this.w * 0.5, this.h * 0.3, 0);
    vertex(-this.w * 0.4, this.h * 0.5, 0);
    //connect
    vertex(this.w * 0.4, this.h * 0.5, 0);
    endShape();

    // back
    beginShape();
    // bottom right
    vertex(this.w * 0.4, this.h * 0.5, -this.d);
    vertex(this.w * 0.5, this.h * 0.3, -this.d);
    // upper right
    vertex(this.w * 0.5, -this.h * 0.3, -this.d);
    vertex(this.w * 0.4, -this.h * 0.5, -this.d);
    // upper left
    vertex(-this.w * 0.4, -this.h * 0.5, -this.d);
    vertex(-this.w * 0.5, -this.h * 0.3, -this.d);
    // bottom left
    vertex(-this.w * 0.5, this.h * 0.3, -this.d);
    vertex(-this.w * 0.4, this.h * 0.5, -this.d);
    // connect
    vertex(this.w * 0.4, this.h * 0.5, -this.d);
    endShape();

    // sides
    // top and bottom
    push();
    translate(0, -this.h / 2, -this.d / 2);
    rotateX(PI / 2);
    rect(0, 0, this.w * 0.8, this.d);
    pop();

    push();
    translate(0, this.h / 2, -this.d / 2);
    rotateX(PI / 2);
    rect(0, 0, this.w * 0.8, this.d);
    pop();

    // left and right
    push();
    translate(this.w / 2, 0, -this.d / 2);
    rotateX(PI / 2);
    rotateY(PI / 2);
    rect(0, 0, this.h * 0.6, this.d);
    pop();

    push();
    translate(-this.w / 2, 0, -this.d / 2);
    rotateX(PI / 2);
    rotateY(PI / 2);
    rect(0, 0, this.h * 0.6, this.d);
    pop();

    // corners
    // bottom right
    beginShape();
    vertex(this.w * 0.4, this.h * 0.5, 0);
    vertex(this.w * 0.5, this.h * 0.3, 0);
    vertex(this.w * 0.5, this.h * 0.3, -this.d);
    vertex(this.w * 0.4, this.h * 0.5, -this.d);
    endShape();

    // upper right
    beginShape();
    vertex(this.w * 0.5, -this.h * 0.3, 0);
    vertex(this.w * 0.4, -this.h * 0.5, 0);
    vertex(this.w * 0.4, -this.h * 0.5, -this.d);
    vertex(this.w * 0.5, -this.h * 0.3, -this.d);
    endShape();

    // upper left
    beginShape();
    vertex(-this.w * 0.4, -this.h * 0.5, 0);
    vertex(-this.w * 0.5, -this.h * 0.3, 0);
    vertex(-this.w * 0.5, -this.h * 0.3, -this.d);
    vertex(-this.w * 0.4, -this.h * 0.5, -this.d);
    endShape();

    // bottom left
    beginShape();
    vertex(-this.w * 0.5, this.h * 0.3, 0);
    vertex(-this.w * 0.4, this.h * 0.5, 0);
    vertex(-this.w * 0.4, this.h * 0.5, -this.d);
    vertex(-this.w * 0.5, this.h * 0.3, -this.d);
    endShape();

    this.sideDisplay(bH / 2, 1, -PI / 5);
    this.sideDisplay(bH / 2, -1, PI / 5);

    pop();
  }

  sideDisplay(pos, sign, angle) {
    push();
    translate(0, pos * sign, -this.d);
    rotateX(angle);

    fill(23);
    box(this.w * 0.7, this.h * 0.2, this.d);
    pop();
  }
}

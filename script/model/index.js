// to customize
// how much to zoom on watch
let zoomScale = 0.9;
// background colors
let red = 49;
let green = 50;
let blue = 51;
// start with rotation of clock (R to toggle)
let rotateBox = true;

// rest
let cam;

let boxAngle;
let a = 0;
let camAngle = 0.005;

let windowWidth = window.innerWidth;
let windowHeight = window.innerHeight;
let clockWidth, clockHeight;
let rWidth, rHeight, offset;
let hPos, mPos, sPos;

let brailleWidth, brailleHeight;
let dotSize;

let bW, bH, bD;

let timeClock = [];
let digits = [];
let symbols = [];
let body;

// Processing 3D showcase with camera to look at box

function setup() {
  createCanvas(windowWidth * 0.9, windowHeight * 0.6, WEBGL);

  rectMode(CENTER);

  // camera to smoothly move around
  cam = createEasyCam({ distance: width * zoomScale });
  cam.setDistanceMin(500);
  cam.setDistanceMax(2000);

  document.oncontextmenu = function () {
    return false;
  };

  // clock width and height to display responsive to screen
  clockWidth = width / 10;
  clockHeight = height / 2;
  // variables to declare offset
  hPos = 3;
  mPos = 5.5;
  sPos = 7.7;

  // segment width and height responsive to layout
  rWidth = width >= height ? width / 15 : height / 15;
  rHeight = width >= height ? height / 50 : width / 50;
  offset = width >= height ? rWidth * 0.05 : rHeight * 0.05;

  // array with each digit of time
  timeClock = int(
    ("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split("")
  );

  // digit = (x pos, y pos, time digit, width of segment, height of segment)
  digits[0] = new Digit(
    hPos * clockWidth - rWidth,
    clockHeight,
    timeClock[0],
    rWidth,
    rHeight
  );
  digits[1] = new Digit(
    hPos * clockWidth + (rWidth * 2) / 3,
    clockHeight,
    timeClock[1],
    rWidth,
    rHeight
  );
  digits[2] = new Digit(
    mPos * clockWidth - rWidth,
    clockHeight,
    timeClock[2],
    rWidth,
    rHeight
  );
  digits[3] = new Digit(
    mPos * clockWidth + (rWidth * 2) / 3,
    clockHeight,
    timeClock[3],
    rWidth,
    rHeight
  );
  digits[4] = new Digit(
    sPos * clockWidth - rWidth,
    clockHeight + (rWidth / 2 + rHeight / 2),
    timeClock[4],
    rWidth / 2,
    rHeight / 2
  );
  digits[5] = new Digit(
    sPos * clockWidth,
    clockHeight + (rWidth / 2 + rHeight / 2),
    timeClock[5],
    rWidth / 2,
    rHeight / 2
  );

  // braille dots width and height to display responsive to screen
  brailleWidth = width / 2;
  brailleHeight = height / 2;

  // dotSize for placement
  dotSize = rWidth * 1.5;

  // braille symbols
  symbols[0] = new Braille(
    brailleWidth - dotSize * 2.5,
    brailleHeight,
    dotSize,
    timeClock[0]
  );
  symbols[1] = new Braille(
    brailleWidth - dotSize * 0.9,
    brailleHeight,
    dotSize,
    timeClock[1]
  );
  symbols[2] = new Braille(
    brailleWidth + dotSize * 0.9,
    brailleHeight,
    dotSize,
    timeClock[2]
  );
  symbols[3] = new Braille(
    brailleWidth + dotSize * 2.5,
    brailleHeight,
    dotSize,
    timeClock[3]
  );

  // clock box
  bW = clockWidth * 7.5;
  bH = clockWidth * 6;
  bD = clockWidth;

  boxAngle = PI / 15;

  body = new Body(width / 2, height / 2, -2, bW, bH, bD);
}

function draw() {
  background(red, green, blue);

  cam.setCenter([width / 2, height / 2, 0]);

  // camera movement
  if (rotateBox) {
    cam.rotateY(camAngle);
    camAngle = map(cos(a), -1, 1, -0.005, 0.005);
    a += 0.005;
  }

  push();
  rotateX(boxAngle);

  // clock box display
  lights();
  body.display();

  // digit display and update
  timeClock = int(
    ("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split("")
  );
  for (let index = 0; index < digits.length; index++) {
    digits[index].update(timeClock[index]);
    digits[index].display();
  }

  // braille dots of hours and minutes
  for (let index = 0; index < symbols.length; index++) {
    symbols[index].update(timeClock[index]);
    symbols[index].display();
  }
  pop();
}

function keyPressed() {
  if (key == "r" || key == "R") {
    rotateBox = !rotateBox;
  }
}

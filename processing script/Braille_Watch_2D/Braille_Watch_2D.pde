<<<<<<< HEAD
float clockWidth, clockHeight;
float rWidth, rHeight, offset;
float hPos, mPos, sPos;

float brailleWidth, brailleHeight;
float dotSize;


int[] time;
Digit[] digits;
Braille[] symbols;

// Processing just to compile with rasberry Pi or other hardware

void setup() {
  size(900, 600);
  //fullScreen();
  rectMode(CENTER);

  // set window on right size of screen
  windowMove(900, 100);

  // array with each digit of time
  time = int(("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split(""));

  // clock width and height to display responsive to screen
  clockWidth = width/10;
  clockHeight = height/2;

  // variables to declare offset
  hPos = 3;
  mPos = 5.5;
  sPos = 7.7;

  // segment width and height responsive to layout
  rWidth = width/15;
  rHeight = height/50;
  offset = rWidth * 0.05;



  // creation of each digit in seven-segment display
  digits = new Digit[time.length];
  // digit = (x pos, y pos, time digit, width of segment, height of segment)
  digits[0] = new Digit(hPos * clockWidth - (rWidth), clockHeight, time[0], rWidth, rHeight);
  digits[1] = new Digit(hPos * clockWidth + (rWidth * 2/3), clockHeight, time[1], rWidth, rHeight);
  digits[2] = new Digit(mPos * clockWidth - (rWidth), clockHeight, time[2], rWidth, rHeight);
  digits[3] = new Digit(mPos * clockWidth + (rWidth * 2/3), clockHeight, time[3], rWidth, rHeight);
  digits[4] = new Digit(sPos * clockWidth - (rWidth), clockHeight + (rWidth/2 + rHeight/2), time[4], rWidth/2, rHeight/2);
  digits[5] = new Digit(sPos * clockWidth, clockHeight + (rWidth/2 + rHeight/2), time[5], rWidth/2, rHeight/2);


  // braille dots width and height to display responsive to screen
  brailleWidth = width/2;
  brailleHeight = height/2;

  // dotSize for placement
  dotSize = rWidth * 1.5;

  // braille symbols
  symbols = new Braille[4];
  symbols[0] = new Braille(brailleWidth - (dotSize * 2.5), brailleHeight, dotSize, time[0]);
  symbols[1] = new Braille(brailleWidth - (dotSize * 0.9), brailleHeight, dotSize, time[1]);
  symbols[2] = new Braille(brailleWidth + (dotSize * 0.9), brailleHeight, dotSize, time[2]);
  symbols[3] = new Braille(brailleWidth + (dotSize * 2.5), brailleHeight, dotSize, time[3]);
}

void draw() {
  background(51);

  // time display
  //textAlign(CENTER);
  //textSize(height/6);
  //text(hour() + ":" + minute() + ":" + nf(second(), 2), width/2, 100);

  //digit display and update
  time = int(("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split(""));
  for (int index = 0; index < digits.length; index++) {
    digits[index].update(time[index]);
    digits[index].display();
  }

  //braille dots of hours and minutes
  for (int index = 0; index < symbols.length; index++) {
    symbols[index].update(time[index]);
    symbols[index].display();
  }
}
=======
float clockWidth, clockHeight;
float rWidth, rHeight, offset;
float hPos, mPos, sPos;

float brailleWidth, brailleHeight;
float dotSize;


int[] time;
Digit[] digits;
Braille[] symbols;

// Processing just to compile with rasberry Pi or other hardware

void setup() {
  size(900, 600);
  //fullScreen();
  rectMode(CENTER);

  // set window on right size of screen
  windowMove(900, 100);

  // array with each digit of time
  time = int(("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split(""));

  // clock width and height to display responsive to screen
  clockWidth = width/10;
  clockHeight = height/2;

  // variables to declare offset
  hPos = 3;
  mPos = 5.5;
  sPos = 7.7;

  // segment width and height responsive to layout
  rWidth = width/15;
  rHeight = height/50;
  offset = rWidth * 0.05;



  // creation of each digit in seven-segment display
  digits = new Digit[time.length];
  // digit = (x pos, y pos, time digit, width of segment, height of segment)
  digits[0] = new Digit(hPos * clockWidth - (rWidth), clockHeight, time[0], rWidth, rHeight);
  digits[1] = new Digit(hPos * clockWidth + (rWidth * 2/3), clockHeight, time[1], rWidth, rHeight);
  digits[2] = new Digit(mPos * clockWidth - (rWidth), clockHeight, time[2], rWidth, rHeight);
  digits[3] = new Digit(mPos * clockWidth + (rWidth * 2/3), clockHeight, time[3], rWidth, rHeight);
  digits[4] = new Digit(sPos * clockWidth - (rWidth), clockHeight + (rWidth/2 + rHeight/2), time[4], rWidth/2, rHeight/2);
  digits[5] = new Digit(sPos * clockWidth, clockHeight + (rWidth/2 + rHeight/2), time[5], rWidth/2, rHeight/2);


  // braille dots width and height to display responsive to screen
  brailleWidth = width/2;
  brailleHeight = height/2;

  // dotSize for placement
  dotSize = rWidth * 1.5;

  // braille symbols
  symbols = new Braille[4];
  symbols[0] = new Braille(brailleWidth - (dotSize * 2.5), brailleHeight, dotSize, time[0]);
  symbols[1] = new Braille(brailleWidth - (dotSize * 0.9), brailleHeight, dotSize, time[1]);
  symbols[2] = new Braille(brailleWidth + (dotSize * 0.9), brailleHeight, dotSize, time[2]);
  symbols[3] = new Braille(brailleWidth + (dotSize * 2.5), brailleHeight, dotSize, time[3]);
}

void draw() {
  background(51);

  // time display
  //textAlign(CENTER);
  //textSize(height/6);
  //text(hour() + ":" + minute() + ":" + nf(second(), 2), width/2, 100);

  //digit display and update
  time = int(("" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2)).split(""));
  for (int index = 0; index < digits.length; index++) {
    digits[index].update(time[index]);
    digits[index].display();
  }

  //braille dots of hours and minutes
  for (int index = 0; index < symbols.length; index++) {
    symbols[index].update(time[index]);
    symbols[index].display();
  }
}
>>>>>>> 4e2fa3d40068777bb1c099f3829a30abfdb00112

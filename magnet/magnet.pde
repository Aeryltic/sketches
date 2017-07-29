BitSystem bitSystem;

float radius = 120;
int amount = 40;
float mX, mY;
float force = 5;
float minDist = 40;

float dirForce = 4;

String words[] = {"Cześć", "co u Ciebie?"};
int currentWord = 0;

BitType bitType = BitType.CAKE;

float centerX, centerY;


void setup() {
  size(1280, 720);
  centerX = width / 2.0;
  centerY = height / 2.0;
  frameRate(60);

  bitSystem = new BitSystem();
  bitSystem.setString(words[currentWord]);
}

void draw() {
  background(color(255, 20, 147));
  bitSystem.update();
  stroke(255);
  strokeWeight(1);
  noFill();
  ellipse(mouseX, mouseY, 2*radius, 2*radius);
}

void mousePressed() {
  mX = mouseX;
  mY = mouseY;
  if (mouseButton == LEFT) {
    bitSystem.addBits(mX, mY, amount, radius, bitType);
  } else if (mouseButton == RIGHT) {
    bitSystem.useForce(mX, mY, force, radius);
  }
}

void mouseDragged() {
  if (new PVector(mouseX - mX, mouseY - mY).mag() > minDist) {
    mX = mouseX;
    mY = mouseY;
    if (mouseButton == LEFT) {
      bitSystem.addBits(mX, mY, amount, radius, bitType);
    } else if (mouseButton == RIGHT) {
      bitSystem.useForce(mX, mY, force, radius);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    bitSystem.storm();
  } else if (key == 'c') {
    bitSystem.clear();
  } else if (key == ENTER || keyCode == RETURN) {
    nextString();
  } else if (key == BACKSPACE) {
    prevString();
  } else if (key == '1') {
    bitType = BitType.CAKE;
  } else if (key == '2') {
    bitType = BitType.SAND;
  } else if (key == CODED) {
    if (keyCode == UP) {
      bitSystem.useForce(new PVector(0, -dirForce));
    }
    if (keyCode == DOWN) {
      bitSystem.useForce(new PVector(0, dirForce));
    }
    if (keyCode == LEFT) {
      bitSystem.useForce(new PVector(-dirForce, 0));
    }
    if (keyCode == RIGHT) {
      bitSystem.useForce(new PVector(dirForce, 0));
    }
  }
}

void mouseWheel(MouseEvent event) {
  radius += 3 * event.getCount();
}

void nextString() {
  if (currentWord + 1 < words.length) {
    currentWord++;
    bitSystem.setString(words[currentWord]);
  }
}

void prevString() {
  if (currentWord > 0) {
    currentWord--;
    bitSystem.setString(words[currentWord]);
  }
}
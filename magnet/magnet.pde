BitSystem bitSystem;
float radius = 80;
int amount = 20;
float mX, mY;
float force = 5;
float minDist = 40;

void setup() {
  size(1280, 720);
  frameRate(60);

  bitSystem = new BitSystem();
}

void draw() {
  background(150);
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
    bitSystem.addBits(mX, mY, amount, radius);
  } else if (mouseButton == RIGHT) {
    bitSystem.useForce(mX, mY, force, radius);
  }
}

void mouseDragged() {
  if (new PVector(mouseX - mX, mouseY - mY).mag() > minDist) {
    mX = mouseX;
    mY = mouseY;
    if (mouseButton == LEFT) {
      bitSystem.addBits(mX, mY, amount, radius);
    } else if (mouseButton == RIGHT) {
      bitSystem.useForce(mX, mY, force, radius);
    }
  }
}

void keyPressed() {
  if(key == ' ') {
    bitSystem.clear();
  }
}

void mouseWheel(MouseEvent event) {
  radius += event.getCount(); 
}
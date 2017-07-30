enum BitType {
  CAKE, SAND;
}

class Bit {

  private static final float ROT_DIV = 1.0 / 260.0;
  private static final float FRICTION = 0.2;

  public PVector pos;
  public PVector speed;
  public PVector acc;
  public float angle;
  public float len;
  public float stroke;
  public color c;
  //public float rotSpeed;
  public float mass_rec;

  public boolean alive;

  public Bit(float x, float y, BitType type) {
    pos = new PVector(x, y);
    speed = new PVector(0, 0);
    acc = new PVector(0, 0);
    angle = random(359) / 180.0 * PI;
    switch(type) {
      case CAKE:
        len = random(2) + 3;
        stroke = random(2) + 0.5;
        c = color(random(170, 255), random(170, 255), random(170, 255));
        break;
      case SAND:
        len = random(1) + 1;
        stroke = random(1) + 1;
        c = color(random(240, 255), random(240, 255), random(50, 60));
        break;
    //rotSpeed = 0;
    }
    mass_rec = 1.0 / (stroke * len / 2.0);

    alive = true;
  }

  public void draw() {
    PVector end = new PVector(len, 0);
    end.rotate(angle);
    end.add(pos);

    strokeWeight(stroke);
    stroke(c);

    line(pos.x, pos.y, end.x, end.y);
  }

  public void applyForce(PVector force) {
    speed.add(PVector.mult(force, mass_rec));
  }
}
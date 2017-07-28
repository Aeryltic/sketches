class Bit {
  private static final float ROT_DIV = 1.0 / 20.0;

  public PVector pos;
  public PVector speed;
  public PVector acc;
  public float angle;
  public float len;
  public int stroke;
  public color c;
  public float rotSpeed;
  
  public boolean alive;

  public Bit(float x, float y) {
    pos = new PVector(x, y);
    speed = new PVector(0, 0);
    acc = new PVector(0, 0);
    angle = random(359) / 180.0 * PI;
    len = random(5) + 10;
    stroke = round(random(2)) + 2;
    c = color(100 + random(155), 100 + random(155), 100 + random(155));
    rotSpeed = 0;
    
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
    speed.add(force);
    rotSpeed = (force.heading()) * ROT_DIV;
  }
}
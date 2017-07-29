class BitSystem {
  private static final float CLEAR_FORCE = 70;

  private ArrayList<Bit> bits;
  private MagneticField magField; 

  public BitSystem() {
    bits = new ArrayList();
    magField = new MagneticField();
  }

  public void update() {
    for (int i = 0; i < bits.size(); i++) {
      Bit bit = bits.get(i);

      if (bit.alive == true) {
        bit.acc.mult(0);
        bit.acc.sub(bit.speed);
        int bX = int(bit.pos.x), bY = int(bit.pos.y);
        if (magField.mag[bY][bX] == true) {
          bit.acc.limit(magField.force);
        } else {
          bit.acc.limit(Bit.FRICTION);
        }
        bit.speed.add(bit.acc);

        bit.pos.add(bit.speed);
        if (bit.pos.x < 0 || bit.pos.y < 0 || bit.pos.x >= width || bit.pos.y >= height) {
          bits.remove(i);
          i--;
          continue;
        }

        bit.angle += bit.speed.mag() * (bit.speed.x > 0 ? 1 : -1) * Bit.ROT_DIV;

        bit.draw();
      }
    }
  }

  public void addBits(float x, float y, int amount, float r, BitType type) {
    for (int i=0; i < amount; i++) {
      PVector p = new PVector(random(r), 0);
      p.rotate(random(TWO_PI));
      p.add(x, y);
      if (p.x >= 0 && p.x < width && p.y >= 0 && p.y < height) {
        bits.add(new Bit(p.x, p.y, type));
      }
    }
  }

  public void useForce(float x, float y, float f, float r) {
    float fr = f / sqrt(r);
    float rr = r * r;
    for (Bit bit : bits) {
      PVector force = new PVector(bit.pos.x - x, bit.pos.y - y);
      float magSq = force.magSq();
      if (magSq < rr) {
        force.setMag(sqrt(r - sqrt(magSq)) * fr);
        bit.applyForce(force);
      }
    }
  }

  public void useForce(PVector force) {
    for (Bit bit : bits) {
      bit.applyForce(force);
    }
  }

  public void clear() {
    bits.clear();
  }

  public void storm() {
    for (Bit bit : bits) {
      bit.applyForce(PVector.random2D().mult(CLEAR_FORCE));
    }
  }

  public void setString(String string) {
    magField.clear();
    storm();
    magField.setString(string);
  }
}
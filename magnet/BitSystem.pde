class BitSystem {
  private ArrayList<Bit> bits;
  private MagneticField magField; 

  public BitSystem() {
    bits = new ArrayList();
    magField = new MagneticField(width, height); // screen width and height

    magField.turnOnRect(300, 300, 20, 300);
  }

  public void update() {
    for (Bit bit : bits) {
      if (bit.alive == true) {
        bit.acc.mult(0);
        bit.acc.sub(bit.speed);
        int bX = int(bit.pos.x), bY = int(bit.pos.y);
        if (magField.mag[bY][bX] == true) {
          bit.acc.limit(magField.force);
        } else {
          bit.acc.limit(0.3);
        }
        bit.speed.add(bit.acc);

        bit.pos.add(bit.speed);
        if (bit.pos.x < 0 || bit.pos.y < 0 || bit.pos.x >= width || bit.pos.y >= height) {
          bit.alive = false;
          continue;
        }

        if (bit.speed.magSq() > 0) {
          bit.angle += bit.rotSpeed;
        }

        bit.draw();
      }
    }
  }

  public void addBits(float x, float y, int amount, float r) {
    for (int i=0; i < amount; i++) {
      PVector p = new PVector(random(r), 0);
      p.rotate(random(TWO_PI));
      p.add(x, y);
      bits.add(new Bit(p.x, p.y));
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
  
  public void clear() {
    bits.clear(); 
  }
}
class MagneticField {
  public int w, h;
  public boolean mag[][];
  public float force;

  public MagneticField(int w, int h) {
    this.w = w;
    this.h = h;
    mag = new boolean[h][];
    for (int i = 0; i < h; i++) {
      mag[i] = new boolean[w];
      for (int j = 0; j < w; j++) {
        mag[i][j] = false;
      }
    }
    force = 500;
  }
  
  public void turnOnRect(int x, int y, int w, int h) {
    for(int i = y; i < y + h; i++) {
      for(int j = x; j < x + w; j++) {
        mag[i][j] = true;
      }
    }
  }
  
  public void turnOffRect(int x, int y, int w, int h) {
    for(int i = y; i < y + h; i++) {
      for(int j = x; j < x + w; j++) {
        mag[i][j] = false;
      }
    }
  }
}
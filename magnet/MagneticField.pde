String fontName = "Arial Bold";

class MagneticField {

  
  public boolean mag[][];
  public float force;

  public MagneticField() {
    mag = new boolean[height][width];
    //for (int i = 0; i < height; i++) {
    //  for (int j = 0; j < width; j++) {
    //    mag[i][j] = false;
    //  }
    //}
    force = 500;
  }

  public void turnOnRect(int x, int y, int w, int h) {
    for (int i = y; i < y + h; i++) {
      for (int j = x; j < x + w; j++) {
        mag[i][j] = true;
      }
    }
  }

  public void turnOffRect(int x, int y, int w, int h) {
    for (int i = y; i < y + h; i++) {
      for (int j = x; j < x + w; j++) {
        mag[i][j] = false;
      }
    }
  }

  public void setString(String word) {
    PGraphics pg = createGraphics(width, height);
    pg.beginDraw();
    pg.fill(0);
    pg.textSize(100);
    pg.textAlign(CENTER);
    PFont font = createFont(fontName, 100);
    pg.textFont(font);
    pg.text(word, width/2, height/2);
    pg.endDraw();
    pg.loadPixels();

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (pg.pixels[y * width + x] != 0) {
          mag[y][x] = true;
        } else {
          mag[y][x] = false;
        }
      }
    }
  }

  public void clear() {
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        mag[y][x] = false;
      }
    }
  }
}
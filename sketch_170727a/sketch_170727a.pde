float r = 80;
int n = 8;
float d = (4.0 / 3.0) * tan(PI / (2 * n)) * r;
float ad = 2 * PI / n;

void setup() {
  size(640, 480);
}

void draw() {
  PVector c = new PVector(mouseX, mouseY);
  background(0);
  
  float[] a = new float[n];
  float[] x = new float[n];
  float[] y = new float[n];
  for(int i=0; i < n; i++) {
    a[i] = ad * i;
    x[i] = c.x + cos(a[i]) * r;
    y[i] = c.y + sin(a[i]) * r;
    if(x[i] < 0) x[i] = 0;
    else if(x[i] >= width) x[i] = width - 1;
    if(y[i] < 0) y[i] = 0;
    else if(y[i] >= height) y[i] = height - 1;
  }
  
  stroke(255);
  strokeWeight(2);
  for(int i=0; i<n; i++) {
    int j = (i + 1) % n;
    // calc
    float lx = x[i], ly = y[i], rx = x[j], ry = y[j];
    // ...
    
    //
    bezier(x[i], y[i], lx, ly, rx, ry, x[j], y[j]);
  }
}
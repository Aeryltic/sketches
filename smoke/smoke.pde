float r = 60;
float dr = 1.0 / r;
int num = 120;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(640, 360);
  noStroke();
  fill(255, 153); 
}

void draw() {
  background(51); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX + (random(1) - 0.5) * r;
  my[which] = mouseY + (random(1) - 0.5) * r;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    my[index] -= 1;
    ellipse(mx[index], my[index], 1.0 * i * r / num, 1.0 * i * r / num);
  }
}
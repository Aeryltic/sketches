class FlowField {
  public PVector flows[][];
  public int fieldW, fieldH;
  
  private float dx, dy;
  
  
  public FlowField(int w, int h) {
    fieldW = w;
    fieldH = h;
    flows = new PVector[h][w];
    
    dx = float(fieldW) / width;
    dy = float(fieldH) / height;
    for(int i=0; i<fieldH; i++) {
      for(int j=0; j<fieldW; j++) {
        flows[i][j] = new PVector(1, 0); 
      }
    }
  }
  
  public PVector get(float fx, float fy) {
    int x = int(fx * dx);
    int y = int(fy * dy);
    
    return flows[y][x];
  }
  
}
class board {
  float f = 0;
  int scl = 25;
  int cols = width/scl;
  int rows = height/scl;

  void show() {
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        rect(x*scl, y*scl, scl, scl);
      }
    }
  }

  void lines() {
    stroke(255);
    line(b.scl*2, b.scl*2, b.scl*2, height);
    line(b.scl*2, b.scl*2, width, b.scl*2);
    line(width-b.scl*2, b.scl*2, width-b.scl*2, height-b.scl*2);
  }
}

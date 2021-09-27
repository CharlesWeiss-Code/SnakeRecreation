class food {
  PVector pos = new PVector(int(random(1,b.cols-1)),int(random(1,b.rows-1)));
  PVector loc;
  boolean eaten = false;

  void show() {
    push();
    fill(0,255,0);
    loc = new PVector(pos.x*b.scl, pos.y*b.scl);
    rect(loc.x, loc.y, b.scl, b.scl);
    pop();
  }
  
  boolean eaten() {
    if (pos.x == s.pos.x && pos.y == s.pos.y) {
      return true;
    } else {
      return false;
    }
  }
}

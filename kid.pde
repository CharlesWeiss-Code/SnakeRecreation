class kid { 
  int b = int(map(s.kids+1,1,s.locations.size(),0,255));
  
  color colors() {
    colorMode(HSB);
    color c = color(0,255,255-b);
    return c;
  }
}

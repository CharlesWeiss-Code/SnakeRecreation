class snake {
  boolean left, right, down, up = false;
  PVector pos = new PVector(b.cols/2, b.rows/2);
  PVector vel = new PVector(0, 0);
  PVector loc;
  int kids = 0;
  ArrayList<PVector> locations = new ArrayList<PVector>();
  boolean hasKids=  false;
  boolean dead = false;
  boolean showEnd = false;



  void show() {
    loc = new PVector(pos.x*b.scl, pos.y*b.scl);
    if (left) {
      pos.x-=1;
      locations.add(loc);
    } else if (right) {
      pos.x+=1;
      locations.add(loc);
    } else if (down) {
      pos.y +=1;
      locations.add(loc);
    } else if (up) {
      pos.y-=1;
      locations.add(loc);
    }
    push();
    fill(255, 0, 0);
    rect(loc.x, loc.y, b.scl, b.scl);
    pop();
  }

  void limitLoc() {
    if (locations.size() > kids+2) {
      //locations.remove(locations.get(locations.size()-kids-1));
      locations.remove(locations.get(0));
    }
  }

  void showKids() {
    for (int i = kids; i > 0; i--) {
      push();
      colorMode(HSB);
      fill(0,255,255);
      rect(locations.get(locations.size()-i-1).x, locations.get(locations.size()-i-1).y, b.scl, b.scl);
      pop();
    }
  }

  void checkTail() {
    if (hasKids) {
      for (int i = 0; i < kids+1; i++) {
        if (loc.x == locations.get(i).x && loc.y == locations.get(i).y) {
          dead = true;
        }
      }
    }
  }

  void checkEdges() {
    if (pos.x == b.cols+1|| pos.x == -2) {
      dead = true;
    } else if (pos.y == b.rows+1 || pos.y == -2) {
      dead = true;
    }
  }

  void dead() {
    if (showEnd) {
      if (dead) {
        background(0);
        String newGame = "Press 'N' for New Game";
        String finalScore = "Final Score: " +kids;
        String exit = "Press 'E' to Exit Game";
        textSize(64);
        textAlign(CENTER);
        text(newGame, width/2, height/4);
        text(finalScore, width/2, height/8);
        textSize(20);
        text(exit, width/2, height-20);
      }
    }
  }

  void showScore() {
    if (dead == false) {
      String score = "Score: " +kids;
      textSize(32);
      textAlign(LEFT);
      text(score, width/50, height/25);
    }
  }
}

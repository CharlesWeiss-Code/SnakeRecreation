ArrayList<food> food = new ArrayList<food>();
ArrayList<kid> kids = new ArrayList<kid>();


board b;
snake s;
int numFood = 2;
void setup() {
  fullScreen();
  b = new board();
  s = new snake();
  for (int i = 0; i < numFood; i ++) {
    food.add(new food());
  }
}

void draw() {
  frameRate(10);
  background(0);
  //b.show();
  if (s.dead == false) {
    s.show();
    //b.show();
    //b.lines();
    foodStuff();
    newFood();
    s.showKids();
    s.limitLoc();
    s.checkTail();
    s.checkEdges();
    s.showScore();
    if (s.dead) {
      s.showEnd = true;
    }
  }
  s.dead();
}

void keyPressed() {
  if (s.left == false) {
    if (key == 'd' || key == 'D') {
      s.right = true;
      s.left = false;
      s.down = false;
      s.up = false;
    }
  }
  if (s.right == false) {
    if (key == 'a' || key == 'A') {
      s.left = true;
      s.right = false;
      s.down = false;
      s.up = false;
    }
  } 
  if (s.down == false) {
    if (key == 'w' || key == 'W') {
      s.up = true;
      s.down = false;
      s.right = false;
      s.left = false;
    }
  } 
  if (s.up == false) {
    if (key == 's' || key == 'S') {
      s.down = true;
      s.up = false;
      s.right = false;
      s.left = false;
    }
  }
  if (s.dead) {
    if (key == 'n' || key == 'N') {
      s.showEnd = false;
      newGame();
    } else if (key == 'e' || key == 'E') {
      exit();
    }
  }
}

void newFood() {
  for (int i = food.size()-1; i > 0; i--) {
    if (food.get(i).eaten()) {
      food.remove(i);
      s.kids++;
      kids.add(new kid());
      s.hasKids = true;
      //PVector oldLoc = new PVector(s.loc.x, s.loc.y);
      //s.locations.add(oldLoc);
      food.add(new food());
    }
  }
}

void foodStuff() {
  for (int i = food.size()-1; i > 0; i --) {
    food.get(i).show();
  }
}

void newGame() {
  s.left = false;
  s.right = false;
  s.up = false;
  s.down = false;

  s.kids = 0;
  s.pos.x = b.cols/2;
  s.pos.y = b.rows/2;
  s.dead = false;
}

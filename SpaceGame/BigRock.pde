//class Boss {
//  int x, y, diam, speed, rand, health;
//  PImage rock;

//  Boss(int x, int y) {
//    this.x = x;
//    this.y = y;
//    speed = int(random(1, 9));
//    diam = int(random(100, 150));
//    health = diam;
//    rand = int(random(3));
//    rock = loadImage("pigeon.png");
//  }
//  void display() {
//    image(rock, x, y);
//    rock.resize(150,150);
//    textAlign(CENTER,CENTER);
//  }


//  void move() {
//    y+=speed;
//  }
//  boolean reachedBottom() {
//    if (y>height+50) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//    boolean intersect(SpaceShip s) {
//    float distance = dist(x, y, s.x, s.y);
//    if (distance<40) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}

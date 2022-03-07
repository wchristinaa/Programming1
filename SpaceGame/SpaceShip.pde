    class SpaceShip {
  // Member Variables
  int x, y, w, health, laserCount,turret;
  boolean alive;
  PImage ship;
  // Constructor
  SpaceShip() {
    x=0;
    y=0;
    w=50;
    health=100;
    laserCount=50;
    //turret = 1;
    alive = true;
    ship = loadImage("ship.png");
  }
  //Member Methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    ship.resize(100, 100);
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move() {
  }
  boolean fire() {
    if (laserCount < 0) {
      return false;
    } else {
      return true;
    }
  }

  boolean intersect(Rock r) {
    return true;
  }
}

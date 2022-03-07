class Laser {
  int x, y, w, h, speed;
  PImage laser;
  Laser(int x, int y) {
    this.x= x;
    this.y = y;
    w= 3;
    h = 8;
    speed = 8;
    laser = loadImage("droplet.png");
  }

  void display() {
    image(laser, x, y);
  }
  void move() {
    y-=speed;
  }
  boolean reachTop() {
    if (y<0-50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float distance = dist(x, y, r.x, r.y);
    if (distance<10) {
      return true;
    } else {
      return false;
    }
  }
}

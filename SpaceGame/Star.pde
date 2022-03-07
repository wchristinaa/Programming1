class Star {
  int x, y, diam, speed;

  Star() {
    x=int(random(width));
    y = -10;
    diam = int(random(1, 5));
    speed = int (random(1, 10));
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, 2, 2);
  }
  void move() {
    y+=speed;
  }
  boolean reachedBottom() {
    if (y>height-50) {
      return true;
    } else {
      return false;
    }
  }
}

  class PowerUp {
  int x, y, diam, speed, rand;
  char type;

  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 9));
    diam = int(random(25, 25));
    rand = int(random(3));
    if(rand == 0){
    type = 'h'; //increases health
    }else if(rand == 1){
      type = 'l'; //laser count
      //}else if(rand == 2){
      //type = 't'; // turrett count
    }
  }
  void display() {
    //image(rock, x, y);
     if(type == 'h'){
    fill(255,10,10);//increases health
    }else if(type == 'l'){
      fill(50,100,255); //laser count
      //}else if(type == 't'){
      //fill(180,100,255); // turrett count
    }
    ellipse(x,y,diam,diam);
    textSize(0);
    fill(0);
    //text(diam,x,y);
    
  }


  void move() {
    y+=speed;
  }
  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
    boolean intersect(SpaceShip s) {
    float distance = dist(x, y, s.x, s.y);
    if (distance<40) {
      return true;
    } else {
      return false;
    }
  }
}

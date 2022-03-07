//Christina Wu 2021 || "Sky Game"
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer;
Timer puTimer;
int score, level, rockTime, starCount;
boolean play;
PImage start;


void setup() {
  size(500, 500);
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  starCount = 100;
  rockTime = 1000;
  rockTimer = new Timer(rockTime);
  puTimer = new Timer(5000);
  puTimer.start();
  play = false;
}

void draw() {
  background(120, 200, 250);
  noCursor();
  if (!play) {
    startScreen();
  } else {
    //Adding rocks on a timer
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }
    //Adding rocks on a timer
    if (puTimer.isFinished()) {
      powerUps.add(new PowerUp(int(random(width)), -50));
      puTimer.start();
    }
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp p = powerUps.get(i);
      p.display();
      p.move();
      if (p.intersect(s1)) {
        //Find out what type of pwoerup
        if (p.type == 'h') {
          s1.health += 25;
          powerUps.remove(p);
        }if (p.type == 'l') {
          s1.laserCount += 10;
          powerUps.remove(p);
        //}if (p.type == 't') {
        //  //s1.turret += 2;
        //  powerUps.remove(p);
        }
      }
      if (p.reachedBottom()) {
        powerUps.remove(p);
      }
    }
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score = score + 10;
          lasers.remove(l);
          rocks.remove(r);
        }
      }
      if (rockTimer.isFinished()) {
        rocks.add(new Rock(int(random(width)), -100));
        rockTimer.start();
      }
      l.display();
      l.move();
      if (l.reachTop()) {
        lasers.remove(l);
      }
    }
    //Ship
    s1.display(mouseX, 450);
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -100));
    }
    stars.add(new Star());
    for (int i = 0; i < stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
    //Display rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      r.display();
      r.move();
      if (r.intersect(s1)) {
        rocks.remove(r);
        score-=10;
        s1.health-=10;
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      }
    }
    infoPanel();
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
  // Determine if Gameover sequence is to be run
}
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 30);
  fill(255, 200);
  textSize(15);
  textAlign(CENTER);
  text("Score:" + score + "  Level:" + level + "  Health:" + s1.health, width/2, 25);
}
void startScreen() {
  start = loadImage("sky.png");
  image(start, 500, 500);
  fill(255);
  textSize(30);
  text("Welcome to SkyGame!", 100, height/2);
  text("click anywhere to begin..", 100, height/2+20);
  if (mousePressed) {
    play=true;
  }
}
void gameOver() {
  fill(255);
  text("Game Over", width/2, height/2);
  //text("Final Score", score, width/2, height/2);
  //text("Level Up:", level, width/2, height/2);
}
void ticker() {
}
void mousePressed() {
  if (s1.fire()) {
    if(s1.turret == 1){
    lasers.add(new Laser(s1.x, s1.y));
    }else if(s1.turret == 2){
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    }
  }
  s1.laserCount--;
}
void keyPressed() {
  if (s1.fire()) {
    if (key == ' ') {
      lasers.add(new Laser(s1.x, s1.y));
    }
  }
}

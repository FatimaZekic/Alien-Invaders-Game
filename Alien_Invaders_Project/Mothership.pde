PImage boss;
boolean on = false;
float xboss = 800;
float yboss = 50;
int speedboss = 8;
int directionboss = -1;

void onscreen() {
  // if on is true, it draws the boss
  if (on == true) {
    boss = loadImage("alien_red.png");
    image(boss, xboss, yboss, 300, 300);
    xboss+=(speedboss*directionboss);
    //once the boss kinda comes half way to the screen, it stops there
    if (xboss<=300) {
      xboss=300;
    }
  }
}

void shoot() {
  //this keeps more bullets shooting from the boss
  bulletList.add(new Bullets(xboss, yboss, 16, -1, true));
}

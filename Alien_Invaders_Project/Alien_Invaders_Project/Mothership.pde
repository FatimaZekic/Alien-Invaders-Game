PImage boss;
boolean on = false;
float xboss = 800;
float yboss = 50;
int speedboss = 5;
int directionboss = -1;
int health = 5;

void onscreen() {
  if (on == true) {
    boss = loadImage("alien_red.png");
    image(boss, xboss, yboss, 300, 300);
    xboss+=(speedboss*directionboss);
    if (xboss<=300) {
      xboss=300;
    }
  }
}

void shoot() {
  bulletList.add(new Bullets(xboss, yboss, 16, -1, true));
}

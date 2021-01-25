// level 1 aliens
Alien alien1;
Alien alien2;
Alien alien3;
// level 2 aliens
Alien alien4; 
Alien alien5;
Alien alien6;
Alien alien7;
Alien alien8;
// level 1 bullets
Bullets bullet1;
Bullets bullet2;
Bullets bullet3;
// level 2 bullets
Bullets bullet4; 
Bullets bullet5; 
Bullets bullet6;
Bullets bullet7;
Bullets bullet8;
// level 3 bullets for boss
Bullets bullet9;
Bullets bullet10;
Bullets bullet11;
Bullets bullet12;
Bullets bullet13;
// booleans for the three levels
boolean lv1 = true;
boolean lv2 = false;
boolean lv3 = false;
// booleans for the 3 collision containers for the three levels
boolean col1 = true;
boolean col2 = false;
boolean col3 = false;
// array list for the bullets so that there can be infinite bullets
ArrayList<Bullets> bulletList = new ArrayList<Bullets>();
//baclground image
PImage galaxy;

void setup() {
  //setting up background
  size(800, 400);
  galaxy = loadImage("galaxy.jpg");
  // creating level 1 aliens and I make them true so that they show up in lvl 1
  alien1 = new Alien(800, 100, 4, -1, true);
  alien2 = new Alien(800, 200, 4, -1, true);
  alien3 = new Alien(800, 300, 4, -1, true);
  // creating level 2 aliens
  alien4 = new Alien(800, 60, 5, -1, false); 
  alien5 = new Alien(800, 120, 5, -1, false);
  alien6 = new Alien(800, 180, 5, -1, false);
  alien7 = new Alien(800, 240, 5, -1, false);
  alien8 = new Alien(800, 300, 5, -1, false);
  // creating lvl 1 bullets and I make them true so that they show up in lvl 1
  bullet1 = new Bullets(800, 100, 4, -1, true);
  bullet2 = new Bullets(800, 200, 4, -1, true);
  bullet3 = new Bullets(800, 300, 4, -1, true);
  // creating lvl 2 bullets
  bullet4 = new Bullets(800, 60, 5, -1, false); 
  bullet5 = new Bullets(800, 120, 5, -1, false);
  bullet6 = new Bullets(800, 180, 5, -1, false);
  bullet7 = new Bullets(800, 240, 5, -1, false);
  bullet8 = new Bullets(800, 300, 5, -1, false);
  // creating lvl 3 bullets for boss
  bullet9 = new Bullets(800, 95, 8, -1, false); 
  bullet10 = new Bullets(800, 200, 8, -1, false);
  bullet11 = new Bullets(800, 300, 8, -1, false);
  bullet12 = new Bullets(800, 150, 8, -1, false);
  bullet13 = new Bullets(800, 250, 8, -1, false);
}

void draw() {
  // stating each boolean and which container they draw
  if (lv1) {
    lvl1();
  }
  if (lv2) {
    lvl2();
  }
  if (lv3) {
    lvl3();
  }
  // these are my collide functions for each lvl
  if (col1) {
    collide();
  }
  if (col2) {
    collide2();
  }
  if (col3) {
    collide3();
  }
}

void keyPressed() {
  // if you press "r" the game restarts beggining from lvl 1 so I make lvl 1 true again and the other levels false
  if (key == 'r') {
    lv1 = true;
    bulletList = new ArrayList<Bullets>();
    lv2 = false;
    lv3 = false;
    // the player shows up again
    drawn = true;
    x = 50;
    y = 180;
    // the aliens and their bullets show up again
    alien1.alive = true;
    alien2.alive = true;
    alien3.alive = true;
    bullet1.there = true;
    bullet2.there = true;
    bullet3.there = true;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
    // I bring back the aliens and the bullets to the right side of the screen
    alien1.xpos = 800;
    alien2.xpos = 800;
    alien3.xpos = 800;
    alien4.xpos = 800;
    alien5.xpos = 800;
    alien6.xpos = 800;
    alien7.xpos = 800;
    alien8.xpos = 800;
    bullet1.x = 800;
    bullet2.x = 800;
    bullet3.x = 800;
    bullet4.x = 800;
    bullet5.x = 800;
    bullet6.x = 800;
    bullet7.x = 800;
    bullet8.x = 800;
  }
}

void lvl1() {
  // background for level 1
  background(255);  
  image(galaxy, 0, 0, 800, 400);
  // im calling the player,aliens and bullets to show up on screen and for it to function
  player();
  alien();
  bullets();
  collide();
  // if the player leaves the screen, then the player enters level 2
  if (x >= 800) {
    lv1 = false;
    lv2 = true;
    // creating a new set of bullets so that the bullets from the first level do not affect the aliens in the second level
    bulletList = new ArrayList<Bullets>();
    lv3 = false;
    // the player shows up on the left side of the screen in level 2
    x = 0;
    alien1.alive = false;
    alien2.alive = false;
    alien3.alive = false;
    bullet1.there = false;
    bullet2.there = false;
    bullet3.there = false;
    // the new aliens become true and appear in level 2
    alien4.alive = true;
    alien5.alive = true;
    alien6.alive = true;
    alien7.alive = true;
    alien8.alive = true;
    // the new bullets coming from the aliens become true and appear in level 2
    bullet4.there = true;
    bullet5.there = true;
    bullet6.there = true;
    bullet7.there = true;
    bullet8.there = true;
    // the bullets from the third level become false
    //bullet9.there = false;
    //bullet10.there = false;
    //bullet11.there = false;
    //bullet12.there = false;
    //bullet13.there = false;
    // the second collision function becomes true while the others become false so that lvl 2 corresponds w the second collision container
    col1 = false;
    col2 = true;
    col3 = false;
  }
}

void player() {
  //i call the container from my "Player" block to make sure the player functions
  express();
  //for each bullet, I say that if it is in the position of the player, the player dies
  if (bullet1.x < x+40 && bullet1.x > x-10 && bullet1.y > y && bullet1.y < y+40) {
    println("hit the ship");
    drawn = false;
    // i tell the person playing the game to hit r to restart
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    // lvl1 1 and the aliens and bullets become false so they're out of the screen
    lv1 = false;
    alien1.alive = false;
    alien2.alive = false;
    alien3.alive = false;
    bullet1.there = false;
    bullet2.there = false;
    bullet3.there = false;
  }
  if (bullet2.x+10 < x && bullet2.y > y && bullet2.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv1 = false;
    alien1.alive = false;
    alien2.alive = false;
    alien3.alive = false;
    bullet1.there = false;
    bullet2.there = false;
    bullet3.there = false;
  }
  if (bullet3.x+10 < x && bullet3.y > y && bullet3.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv1 = false;
    alien1.alive = false;
    alien2.alive = false;
    alien3.alive = false;
    bullet1.there = false;
    bullet2.there = false;
    bullet3.there = false;
  }
  // if the alien's bullet hit the player for lvl 2:
  if (bullet4.x+10 < x && bullet4.y > y && bullet4.y < y+40) {
    drawn = false;
    println("hit the ship");
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    // lvl1 2 and the aliens and bullets become false so they're out of the screen
    lv2 = false;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
  }
  if (bullet5.x+10 < x && bullet5.y > y && bullet5.y < y+40) {
    drawn = false;
    println("hit the ship");
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv2 = false;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
  }
  if (bullet6.x+10 < x && bullet6.y > y && bullet6.y < y+40) {
    drawn = false;
    println("hit the ship");
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv2 = false;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
  }
  if (bullet7.x+10 < x && bullet7.y > y && bullet7.y < y+40) {
    drawn = false;
    println("hit the ship");
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv1 = false;
    lv2 = false;
    lv3 = false;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
  }
  if (bullet8.x+10 < x && bullet8.y > y+5 && bullet8.y < y+30) {
    drawn = false;
    println("hit the ship");
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv2 = false;
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
  }
  // if the alien's bullet hit the player for lvl 3:
  if (bullet9.x+10 < x && bullet9.y > y && bullet9.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv3 = false;
    on = false;
    bullet9.there = false;
    bullet10.there = false;
    bullet11.there = false;
    bullet12.there = false;
    bullet13.there = false;
  }
  if (bullet10.x+10 < x && bullet10.y > y && bullet10.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv3 = false;
    on = false;
    bullet9.there = false;
    bullet10.there = false;
    bullet11.there = false;
    bullet12.there = false;
    bullet13.there = false;
  }
  if (bullet11.x+10 < x && bullet11.y > y && bullet11.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv3 = false;
    on = false;
    bullet9.there = false;
    bullet10.there = false;
    bullet11.there = false;
    bullet12.there = false;
    bullet13.there = false;
  }
  if (bullet12.x+10 < x && bullet12.y > y && bullet12.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv3 = false;
    on = false;
    bullet9.there = false;
    bullet10.there = false;
    bullet11.there = false;
    bullet12.there = false;
    bullet13.there = false;
  }
  if (bullet13.x+10 < x && bullet13.y > y && bullet13.y < y+40) {
    drawn = false;
    background(0);
    textSize(50);
    fill(255, 0, 0);
    text("U done ded", 250, 150);
    textSize(50);
    fill(0, 0, 255);
    text("Press r to Restart", 200, 300);
    lv3 = false;
    on = false;
    bullet9.there = false;
    bullet10.there = false;
    bullet11.there = false;
    bullet12.there = false;
    bullet13.there = false;
  }
}


void keyReleased() {
  if (key == ' ') {// player shoots by referring to the array list to add new bullets everytime you press space
    bulletList.add(new Bullets(x, y, 8, 1, true));
  }
}

//this shows the alien for level 1
void alien() {
  alien1.display();
  alien1.move();
  alien2.display();
  alien2.move();
  alien3.display();
  alien3.move();
}

//this shows the bullets for level 1
void bullets() {
  bullet1.show();
  bullet1.moveb();
  bullet2.show();
  bullet2.moveb();
  bullet3.show();
  bullet3.moveb();
  for (Bullets b : bulletList) {
    b.show();
    b.moveb();
  }
}

// collide function for level 1
void collide() {
  //within the array list of the bullets that are coming from the player, if they are in the position of the aliens, the alien and its bullet becomes false and disappears 
  for (Bullets b : bulletList) {
    if (b.x+10 > alien1.xpos && b.y > alien1.ypos-10 && b.y < alien1.ypos+30) {
      alien1.alive = false;
      bullet1.there = false;
    }
    if (b.x+10 > alien2.xpos && b.y > alien2.ypos-10 && b.y < alien2.ypos+30) {
      alien2.alive = false;
      bullet2.there = false;
    }
    if (b.x+10 > alien3.xpos && b.y > alien3.ypos-10 && b.y < alien3.ypos+30) {
      alien3.alive = false;
      bullet3.there = false;
    }
  }
}

void lvl2() {
  background(255);  
  image(galaxy, 0, 0, 800, 400);
  player();
  bullets2();
  alien2();
  collide2();
  // if the player goes to the next level, lvl 2 becomes false and lvl 3 becomes true
  if (x >= 800) {
    lv1 = false;
    lv2 = false;
    lv3 = true;
    // creating a new set of bullets so that the bullets from the first level do not affect the aliens in the second level
    bulletList = new ArrayList<Bullets>();
    x = 0;
    // the aliens and bullets in lvl 2 become false
    alien4.alive = false;
    alien5.alive = false;
    alien6.alive = false;
    alien7.alive = false;
    alien8.alive = false;
    bullet4.there = false;
    bullet5.there = false;
    bullet6.there = false;
    bullet7.there = false;
    bullet8.there = false;
    // the bullets and boss in level 3 become true 
    bullet9.there = true;
    bullet10.there = true;
    bullet11.there = true;
    bullet12.there = true;
    bullet13.there = true;
    col1 = false;
    col2 = false;
    col3 = true;
    on = true;
  }
}

// bullets for level 2
void bullets2() {
  bullet4.show();
  bullet4.moveb();
  bullet5.show();
  bullet5.moveb();
  bullet6.show();
  bullet6.moveb();
  bullet7.show();
  bullet7.moveb();
  bullet8.show();
  bullet8.moveb();
  for (Bullets b : bulletList) {
    b.show();
    b.moveb();
  }
}

// aliends for level 2
void alien2() {
  alien4.display();
  alien4.move();
  alien5.display();
  alien5.move();
  alien6.display();
  alien6.move();
  alien7.display();
  alien7.move();
  alien8.display();
  alien8.move();
}

// collide function for level 2 
void collide2() {
    //within the array list of the bullets that are coming from the player, if they are in the position of the aliens, the alien and its bullet becomes false and disappears 
  for (Bullets b : bulletList) {
    if (b.x+10 > alien4.xpos && b.y > alien4.ypos-10 && b.y < alien4.ypos+30) {
      alien4.alive = false;
      bullet4.there = false;
    }
    if (b.x+10 > alien5.xpos && b.y > alien5.ypos-10 && b.y < alien5.ypos+30) {
      alien5.alive = false;
      bullet5.there = false;
    }
    if (b.x+10 > alien6.xpos && b.y > alien6.ypos-10 && b.y < alien6.ypos+30) {
      alien6.alive = false;
      bullet6.there = false;
    }
    if (b.x+10 > alien7.xpos && b.y > alien7.ypos-10 && b.y < alien7.ypos+30) {
      alien7.alive = false;
      bullet7.there = false;
    }
    if (b.x+10 > alien8.xpos && b.y > alien8.ypos-10 && b.y < alien8.ypos+30) {
      alien8.alive = false;
      bullet8.there = false;
    }
  }
}

void lvl3() {
  background(255);  
  image(galaxy, 0, 0, 800, 400);
  player();
  onscreen();
  bullets3();
  collide3();
}

//bullets for level 3
void bullets3() {
  bullet9.show();
  bullet9.moveb();
  bullet10.show();
  bullet10.moveb();
  bullet11.show();
  bullet11.moveb();
  bullet12.show();
  bullet12.moveb();
  bullet13.show();
  bullet13.moveb();
  for (Bullets b : bulletList) {
    b.show();
    b.moveb();
  }
}

//collide function for level 3
void collide3() {
  for (Bullets b : bulletList) {
    if (b.x+10 > xboss && b.y > 200 && b.y < 220) {
      health -= 1;
      if (health == 0) {
        on = false;
        bullet9.there = false;
        bullet10.there = false;
        bullet11.there = false;
        bullet12.there = false;
        bullet13.there = false;
      }
    }
  }
}

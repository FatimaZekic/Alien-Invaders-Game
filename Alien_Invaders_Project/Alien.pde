// this is my class for the aliens
class Alien {
  float xpos;
  float ypos;
  PImage alien;
  boolean alive = true;
  int speed;
  int direction;
  Alien(float xpos, float ypos, int speed, int direction, boolean alive) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    this.direction = direction;
    this.alive = alive;
  }
  void display() {
    //if alive is true, it will draw the alien
    if (alive==true){
      alien = loadImage("alien.png");
      image(alien, xpos, ypos, 30, 30);
    }
  }
  void move() {
    // this makes the alien move by adding speed
    xpos+=(speed*direction);
    // once the alien reaches the middle, it stops
    if (xpos<=400) {
      xpos=400;
    } else if (xpos>=800) {
      xpos=0;
    }
  }
  void shoot() {
    // im adding a new bullet for the aliens to shoot
    bulletList.add(new Bullets(this.xpos, this.ypos, 8, -1, true));
  }
}

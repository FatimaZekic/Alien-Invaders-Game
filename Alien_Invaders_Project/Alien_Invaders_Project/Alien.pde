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
    if (alive==true){
      alien = loadImage("alien.png");
      image(alien, xpos, ypos, 30, 30);
      //move();
      //shoot();
    }
  }
  void move() {
    xpos+=(speed*direction);
    if (xpos<=400) {
      xpos=400;
    } else if (xpos>=800) {
      xpos=0;
    }
  }
  void shoot() {
    bulletList.add(new Bullets(this.xpos, this.ypos, 8, -1, true));
  }
}

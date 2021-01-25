//this is my class for the bullets //<>//
class Bullets {
  float x;
  float y;
  int sped;
  int dir;
  boolean there;
  Bullets(float x, float y, int sped, int dir, boolean there) {
    this.x = x;
    this.y = y;
    this.sped = sped;
    this.dir = dir;
    this.there = there;
  }
  void show() {
    // if there is true, it draws and moves the bullets
    if (there == true) {
      fill(0,255,0);
      rect(x, y+10, 10, 5);
      moveb();
    }
  }
  void moveb() {
    x+=(sped*dir);
    //once the first set of bullets reache the opposite end of the screen, they start shooting from the middle of the screen
    if (x<=0) {
      x=400;
    }
}
}

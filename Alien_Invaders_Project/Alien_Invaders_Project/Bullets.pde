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
    if (there == true) {
      fill(0,255,0);
      rect(x, y+10, 10, 5);
      moveb();
    }
  }
  void moveb() {
    x+=(sped*dir);
    if (x<=0) {
      x=400;
    }
}
}

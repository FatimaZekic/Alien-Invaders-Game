PImage player;
boolean drawn = true;
int x = 50;
int y = 180;
void express() {
  //if if drawn is true, it draws the player
  if (drawn == true) {
    player = loadImage("player.png");
    image(player, x, y, 40, 40);
    // the controls for the player
    if (keyPressed) {
      if (key == 'w') {
        y-= 4;
      }
      if (key == 's') {
        y+= 4;
      }
      if (key == 'a') {
        x -= 4;
      }
      if (key == 'd') {
        x += 4;
      }
    }
  }
}

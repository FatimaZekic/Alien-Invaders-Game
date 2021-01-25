PImage player;
boolean drawn = true;
int x = 50;
int y = 180;
void express() {
  if (drawn == true) {
    player = loadImage("player.png");
    image(player, x, y, 40, 40);
    if (keyPressed) {
      if (key == 'w') { //player moves
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

Player spirit;

void setup() {
  size(600, 600);
  spirit = new Player(width/2, height/2, 20);
  println("Hello, player. Spirit has now moved on from flappy bird to take on SMOKE!!!! Can you defeat him?");
}

void keyReleased() {
  spirit.setDir(0, 0);
}

void keyPressed() {
  switch(keyCode) {
    case UP: 
      spirit.setDir(0, -1);
      break;
    case DOWN: 
      spirit.setDir(0, 1);
      break;
    case RIGHT:
      spirit.setDir(1, 0);
      break;
    case LEFT: 
      spirit.setDir(-1, 0);
      break;
  }
}

void draw() {
  background(51);
  spirit.update();
  spirit.show();
  spirit.showHealthBar();
  if (frameCount % 23 == 0) {
    spirit.regenerateHealth();
  }
}

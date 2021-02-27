public class Player {
  public PVector pos;
  private PVector vel;
  public float s;
  private float r;
  public float health;
  public float maxHealth;
  
  Player(float x, float y, float r_) {
    pos = new PVector(x, y);
    vel = new PVector();
    r = r_;
    s = r*2;
    health = 100;
    maxHealth = 100;
  }
  
  public void setDir(float x, float y) {
    vel.set(x, y);
  }
  
  public void takeDamage(float amt) {
    if (health > 0) {
      health-=amt;  
    } 
  }
  
  public void show() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    square(pos.x, pos.y, s);
  }
  
  public void update() {
    s = r*2;
    pos.add(vel);
  }
  
  
  public void showHealthBar() {
    float yOffset = s/2 + 20;
    pushMatrix();
    rectMode(CENTER);
    fill(26);
    float w = 70;
    float h = 15;
    rect(pos.x, pos.y-yOffset, w, h);
    popMatrix();
    rectMode(CORNER);
    fill(0, 255, 0);
    float w2 = (w/maxHealth)*health;
    float h2 = h-1;
    rect(pos.x-w/2, pos.y-yOffset-h/2, w2, h2);
    
    pushMatrix();
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    
    text(round(health) + "%", pos.x, pos.y-yOffset-h/2-25);
    popMatrix();
  }
  
  public void regenerateHealth() {
    if (health < 100) {
        health++;
    }
  }
}

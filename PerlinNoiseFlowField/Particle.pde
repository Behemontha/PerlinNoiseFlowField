class Particle {
  PVector pos = new PVector(random(width-1), random(height-1)); // position
  PVector vel = new PVector(0, 0); // velocity
  PVector acc = new PVector(0, 0); // acceleration
  float maxSpeed = 2;
  
  void update() {
    vel.add(acc); // apply acceleration
    vel.limit(maxSpeed); // limit velocity
    pos.add(vel); // apply velocity
    
    // handle window edges
    if(pos.x >= width) pos.x = 0;
    if(pos.x < 0) pos.x = width - 1;
    if(pos.y >= height) pos.y = 0;
    if(pos.y < 0) pos.y = height - 1;
    
    // reset acceleration
    acc.mult(0); 
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void show() {
    stroke(0);
    strokeWeight(4);
    point(pos.x, pos.y);
  }
  
  void follow(PVector[] flowField) {
    // get the index in the flow field
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = x + y * cols;
    
    // get the force and apply it
    PVector force = flowField[index];
    applyForce(force);
  }
}
float inc = 0.1;
float scl = 10;
int cols, rows;

void setup()
{
  size(200, 200);
  cols = floor(width / scl);
  rows = floor(height / scl);
}

void draw()
{
  background(255);
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      float angle = noise(xoff, yoff) * TWO_PI;
      PVector v = PVector.fromAngle(angle);
      xoff += inc;
      stroke(0);
      pushMatrix();
      translate(x * scl, y * scl);
      rotate(v.heading());
      line(0, 0, scl, 0);
      popMatrix();
    }
    yoff += inc;
  }
}
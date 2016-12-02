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
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      float bright = noise(xoff, yoff) * 255;
      xoff += inc;
      fill(bright);
      rect(x * scl, y * scl, scl, scl);
    }
    yoff += inc;
  }
}
void setup () {
  size (300, 300);
}

void draw () {
  background (0, 0, 0);
  float x = 100, y = 100, r = 100;
  float dx = x - mouseX, dy = y - mouseY;
  if (dx*dx + dy*dy <= r*r) {
    fill(255, 0, 0);
  } else {
    fill (255, 255, 255);
  }
  ellipse(x, y, 2*y, 2*r);
}
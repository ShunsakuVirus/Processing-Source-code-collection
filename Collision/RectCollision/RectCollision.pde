void setup () {
  size (300, 300);
}

void draw () {
  float x = 100, y = 100;
  float w = 100, h = 100;
  background (0, 0, 0);
  if (x <= mouseX && mouseX <= x + w && y <= mouseY && mouseY <= y + h) {
    fill (255, 0, 0);
  } else {
    fill (255, 255, 255);
  }
  rect (x, y, w, h);
}
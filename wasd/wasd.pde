void setup () {
  size (300, 300);
}

float x = 100;
float y = 100;

void draw() {
  background(255, 255, 0);
  ellipse(x, y, 100, 100);
  if (key == 'a') {
    x = x - 5;
  }
  if (key == 'd') {
    x = x + 5;
  }
  if (key == 's') {
    y = y + 5;
  }
  if (key == 'w') {
    y = y - 5;
  }
  key = 0;
}
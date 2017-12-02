void setup () {
  size(300, 300);
}

float x = 100;
float y = 100;
float v = 1;

void draw () {
  background(0, 255, 255);
  ellipse(x, y, 100, 100);
  x = x + v;
  if (300 < x) {
    v = -1;
  }
  if (x < 0) { 
    v = 1;
  }
}
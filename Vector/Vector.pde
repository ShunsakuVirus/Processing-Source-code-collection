void setup() {
  size(500, 500);
}

int cx, cy;

void moveTo(int x, int y) {
  cx = x;
  cy = y;
}

void lineTo(int x, int y) {
  x += cx;
  y += cy;
  line(cx, cy ,x, y);
  moveTo(x, y);
}

void draw() {
  background(255);
  strokeWeight(3);
  
  int x1 = 100, y1 = 100;
  int x2 = 200, y2 = 50;
  int x3 = 100, y3 = 200;
  
  moveTo(x1, y1);
  stroke(255, 0, 0); lineTo(x2, y2);
  stroke(0, 255, 0); lineTo(x3, y3);
  stroke(0); line(x1, y1, cx, cy);
}
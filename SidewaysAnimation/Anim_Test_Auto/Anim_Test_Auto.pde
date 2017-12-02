void setup() {
  size(500, 500);
}

float easeIn(float x) {
  return x*x;
}

float easeOut(float x) {
  x -= 1;
  return 1 - x*x;
}


float f(float x) {
  if (x < 0.5) {
    return easeIn(2*x)/2;
  }
  return easeOut(2*(x - 0.5))/2 + 0.5;
}
float s = 0.00;

void draw() {
  background(255);
  
  int x1 = 100, y1 = 200;
  int w1 = 50, h1 = 50;
  int x2 = 400, y2 = 200;
  int w2 = 50, h2 = 50;
  
  fill(255, 0, 0);
  rect(x1, y1 ,w1, h1);
  fill(0, 255, 0);
  rect(x2, y2 ,w2, h2);
  
  s += 0.01;
  if (1 <= s) {
    s = 0;
  }
  float t = f(s);
  
  float x = (1 - t)*x1 + t*x2;
  float y = (1 - t)*y1 + t*y2;
  float w = (1 - t)*w1 + t*w2;
  float h = (1 - t)*h1 + t*h2;
  fill(0, 0, 255, 100);
  rect(x, y, w, h);
}
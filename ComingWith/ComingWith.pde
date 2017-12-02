void setup () {
  size (300, 300);
}

float x1, y1;
float x2, y2, vx2, vy2;
float x3, y3, vx3, vy3;

void draw () {
  background(0, 0, 0);
  
  fill(255, 255, 255);
  x1 = mouseX;
  y1 = mouseY;
  ellipse(x1, y1, 50, 50);
  
  fill (254, 1, 19);
  vx2 = 0.1*(x1 - x2);
  vy2 = 0.1*(y1 - y2);
  x2 = x2 + vx2;
  y2 = y2 + vy2;
  ellipse(x2, y2, 50, 50);
  
  fill(43, 254, 2);
  vx3 = 0.1*(x2 - x3);
  vy3 = 0.1*(y2 - y3);
  x3 = x3 + vx3;
  y3 = y3 + vy3;
  ellipse(x3, y3, 50, 50);
}
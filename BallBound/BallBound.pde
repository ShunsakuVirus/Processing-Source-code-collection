class Ball {
  float x, y, r;
  float vx, vy;
  color c;
  Ball () {
    x = random(width);
    y = random(10, height/2);
    r = 15;
    vx = random(-5.0, 5.0);
    vy = 1.0;
    pushStyle ();
    colorMode(HSB, 1, 1, 1);
    c = color(random(1), 1, 1);
    popStyle();
  }
  void draw () {
    fill(c);
    ellipse(x, y, 2*r, 2*r);
  }
  void update () {
    x = x + vx;
    y = y + vy;
    if (x < 0 || width < x) {
      vx = -vx;
    }
    if (height < y) {
      y = height - (y - height);
      vy = -vy;
    }
    vy = vy + 0.05;
  }
}

ArrayList<Ball> balls;

void setup () {
  size(600, 600);
  balls = new ArrayList<Ball> ();
  balls.add(new Ball());
  balls.add(new Ball());
  balls.add(new Ball());
  balls.add(new Ball());
}

void draw () {
  background(0, 0, 0);
  for (Ball ball: balls) {
    ball.draw();
    ball.update();
  }
}
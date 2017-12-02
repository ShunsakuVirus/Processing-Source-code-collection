int Point;
int x;
int y;
float a = random(0, 255);
float b = random(0, 255);
int timeCounter = 0;
int limitTime = 40;
int scene = 0;
int damageCounter =0;
int frame = 0;
int r;
void setup() {
  fullScreen();
  background(255);
  ellipseMode(CENTER);
  r = 500;
  x = int (random(400, 1500));
  y = int (random(300, 800));
  frameRate(60);
}

void draw() {
  if (scene == 0)
  {
    textSize (100);
    fill (0);
    text("Click to START!!", 570, 500);
  } else if (scene==1)
  {
    background(255);

    textSize(100);  
    fill (0);
    text(Point, 100, 100);

    fill(a, b, 255, 50);
    ellipse(x, y, r, r);

    timeCounter += 1;

    if (timeCounter %60 == 0)
    {
      limitTime -= 1;
    }
    fill(17, 255, 0);
    textSize (70);
    text(nf(limitTime, 2), 1800, 70);

    if (damageCounter >= 1)
    {
      fill(255, 0, 0);
      ellipse (1600, 30, 50, 50);
    }
    if (damageCounter >= 2)
    {
      fill (255, 0, 0);
      ellipse (1700, 30, 50, 50);
    }

    frame+=1;

    if (frame == 2400) {
      scene = 2;
    }
  } else if (scene==2)
  {
    background (0);
    textSize (100);
    fill (255);
    text ("GAME OVER", 660, 500);
  }
}

void mousePressed() {
  if (scene == 0)
  {
    scene = 1;
  } else if (scene==1)
  {
    if (mouseX <= x+r/2 && mouseX >= x-r/2 && mouseY <= y+r/2 && mouseY >= y-r/2)
    {
      Point+=100;
      x = int (random(400, 1500));
      y = int (random(300, 800));
      r -= 10;
      a = random(0, 255);
      b = random(0, 255);
    }
   else
  {
    damageCounter +=1;

    if (damageCounter >= 3) {
      scene=2;
    }
  }
  }
}
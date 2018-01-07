int start_x, start_y, end_x, end_y;
boolean isClicked = false;
boolean isReleased = false;

void setup() {
  size(500, 500);
  stroke(255);
}

void mouseReleased() {
  isClicked = false;
  isReleased = true;
}

void mousePressed() {
  isClicked = true;
  isReleased = false;
  start_x = mouseX;
  start_y = mouseY;
}

void circle(int centerx,int centery, int rad) {
  int x,y,m,mright,mdown;
  
  m = 1-rad;
  mright=3;
  mdown=5-rad<<1;
  y=rad;
  
  for(x=0;x<=y;x++) {
    if(m<0) {
      m += mright;
      mright += 2;
      mdown += 2;
    }
    else {
      m += mdown;
      mright += 2;
      mdown += 4;
      --y;
    }
    stroke(255);
    point(y+centerx,x+centery);
    point(x+centerx,y+centery);
    point(-x+centerx,y+centery);
    point(-y+centerx,x+centery);
    point(-y+centerx,-x+centery);
    point(-x+centerx,-y+centery);
    point(x+centerx,-y+centery);
    point(y+centerx,-x+centery);
  }
}

void draw() {
  background(0);
  if (isClicked && !isReleased) {
    end_x = mouseX;
    end_y = mouseY;
    int dx = abs(end_x-start_x);
    int dy = abs(end_y-start_y);
    int size = (int)sqrt(dx*dx+dy*dy);
    circle(start_x, start_y, size);
  }
}
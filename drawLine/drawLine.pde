float start_x,start_y,end_x,end_y;
boolean isClicked = false;
boolean isReleased = false;

void setup() {
  size(500,500);
}

void mouseReleased(){
  isClicked = false;
  isReleased = true;
}

void mousePressed() {
  isClicked = true;
  isReleased = false;
  start_x = mouseX;
  start_y = mouseY;
}

void lineTo(float x1,float y1,float x2,float y2) {
  float diffx = x2-x1;
  float diffy = y2-y1;
  float size = sqrt(diffx*diffx+diffy*diffy);
  float normx = diffx/size;
  float normy = diffy/size;
  for(int i=0;i<size;i++) {
    stroke(255);
    point(x1,y1);
    x1 += normx;
    y1 += normy;
  }
}

void draw() {
  background(0);
  if(isClicked && !isReleased) {
    end_x = mouseX;
    end_y = mouseY;
    lineTo(start_x,start_y,end_x,end_y);
  }
}
void setup(){
  size(500,500);
  frameRate(60);
}

PVector v1, v2, v3, v4;
boolean isClicked = false;
boolean isReleased = false;
boolean isDiff = false;
final float theta = 0.70710678118F;

void draw(){
  background(255);
  if(isClicked == true && isReleased == false) {
    //pressing
    v2 = new PVector(mouseX, mouseY);
    if(v1 != v2) isDiff = true;
    else isDiff = false;
    if(v2.x>width) v2.x=width;
    if(v2.x<0) v2.x=0;
    if(v2.y>height) v2.y=height;
    if(v2.y<0) v2.y=0;
    stroke(0);
    line(v1.x, v1.y, v2.x, v2.y);
    float arrowx = v2.x-v1.x;
    float arrowy = v2.y-v1.y;
    float arrowl = sqrt(arrowx*arrowx+arrowy*arrowy);
    float branchl = arrowl /2;
    float arrowAng = atan2(arrowy,arrowx);
    v3 = new PVector(v1.x + cos(arrowAng + theta)*branchl,
                     v1.y + sin(arrowAng + theta)*branchl);
    v4 = new PVector(v1.x + cos(arrowAng - theta)*branchl,
                     v1.y + sin(arrowAng - theta)*branchl);
    stroke(255, 0, 0);
    line(v1.x, v1.y, v3.x, v3.y);
    stroke(0, 0, 255);
    line(v1.x, v1.y, v4.x, v4.y);
  }
  if(isReleased == true && isDiff == true) {
    //Arrows advance
    PVector dir = new PVector(v1.x-v2.x,v1.y-v2.y);
    float size = sqrt(dir.x*dir.x+dir.y*dir.y);
    //The larger the arrow is, the slower it becomes.
    v1.x += dir.x*250/size/size;
    v1.y += dir.y*250/size/size;
    v2.x += dir.x*250/size/size;
    v2.y += dir.y*250/size/size;
    v3.x += dir.x*250/size/size;
    v3.y += dir.y*250/size/size;
    v4.x += dir.x*250/size/size;
    v4.y += dir.y*250/size/size;
    
    stroke(0);
    line(v1.x, v1.y, v2.x, v2.y);
    stroke(255, 0, 0);
    line(v1.x, v1.y, v3.x, v3.y);
    stroke(0, 0, 255);
    line(v1.x, v1.y, v4.x, v4.y);
  }
}
void mouseReleased(){
  isClicked = false;
  isReleased = true;
}

void mousePressed() {
  isClicked = true;
  isReleased = false;
  v1 = new PVector(mouseX, mouseY);
}
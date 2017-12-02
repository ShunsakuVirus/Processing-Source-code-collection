void setup(){
  size(500, 500);
}

PVector v1, v2;
boolean isClicked = false;
boolean isReleased = false;
final float theta = 0.70710678118F;

void draw(){
  background(255);
  if(isClicked == true && isReleased == false) {
    //pressing
    v2 = new PVector(mouseX, mouseY);
    stroke(0);
    line(v1.x, v1.y, v2.x, v2.y);
    float arrowx = v2.x-v1.x;
    float arrowy = v2.y-v1.y;
    float arrowl = sqrt(arrowx*arrowx+arrowy*arrowy);
    float branchl = arrowl /2;
    float arrowAng = atan(arrowy/arrowx);
    PVector v3, v4;
    if((arrowx >= 0 && arrowy >= 0) || 
       (arrowx >= 0 && arrowy <= 0)) {
      v3 = new PVector(v1.x + cos(arrowAng + theta)*branchl,
                       v1.y + sin(arrowAng + theta)*branchl);
      v4 = new PVector(v1.x + cos(arrowAng - theta)*branchl,
                       v1.y + sin(arrowAng - theta)*branchl);
    } 
    else {
      v3 = new PVector(v1.x - cos(arrowAng + theta)*branchl,
                       v1.y - sin(arrowAng + theta)*branchl);
      v4 = new PVector(v1.x - cos(arrowAng - theta)*branchl,
                       v1.y - sin(arrowAng - theta)*branchl);
    }
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
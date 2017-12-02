int pointAX;
int pointAY;
int pointBX;
int pointBY;
int pointCX;
int pointCY;
int vecABX;
int vecABY;
int vecBCX;
int vecBCY;
int vecCAX;
int vecCAY;
int vecABX1;
int vecABY1;
int vecBCX1;
int vecBCY1;
int vecCAX1;
int vecCAY1;
boolean enter = false;
boolean enter1 = false;
boolean enter2 = false;
int enterCount = 0;
int corner;
void setup() {
  size (500, 500);
  frameRate(60);
}

void draw() {
  background(255);
  if(enterCount == 1) {
    stroke(0);
    line(pointAX, pointAY, mouseX, mouseY);
  }
  if(enterCount == 2) {
    stroke(0);
    line(pointAX, pointAY, pointBX, pointBY);
    line(pointBX, pointBY, mouseX, mouseY);
  }
  if(enterCount == 3) {
    InitializeVector();
    line(pointAX, pointAY, pointBX, pointBY);
    line(pointBX, pointBY, pointCX, pointCY);
    line(pointCX, pointCY, pointAX, pointAY);
    
    int collisionAB = mouseX * vecABX + mouseY * vecABY;
    int collisionBA = mouseX * vecABX1 + mouseY * vecABY1;
    int collisionBC = mouseX * vecBCX + mouseY * vecBCY;
    int collisionCB = mouseX * vecBCX1 + mouseY * vecBCY1;
    int collisionCA = mouseX * vecCAX + mouseY * vecCAY;
    int collisionAC = mouseX * vecCAX1 + mouseY * vecCAY1;
    if(collisionBA > 0) stroke(255, 0, 0); else stroke(0);
    //println(collisionAB, collisionBA);
  }
  if(enterCount == 4) enterCount = 0;
}
void mouseClicked() {
  println(enterCount);
  if(enterCount == 0) {
    pointAX = mouseX;
    pointAY = mouseY;
  }
  if(enterCount == 1) {
    pointBX = mouseX;
    pointBY = mouseY;
  }
  if(enterCount == 2) {
    pointCX = mouseX;
    pointCY = mouseY;
  }
  enterCount ++;
}

void InitializeVector() {
  vecABX = pointAX - pointBX;
  vecABY = pointAY - pointBY;
  vecBCX = pointBX - pointCX;
  vecBCY = pointBY - pointCY;
  vecCAX = pointCX - pointAX;
  vecCAY = pointCY - pointAY;
  vecABX1 = pointBX - pointAX;
  vecABY1 = pointBY - pointAY;
  vecBCX1 = pointCX - pointBX;
  vecBCY1 = pointCY - pointBY;
  vecCAX1 = pointAX - pointCX;
  vecCAY1 = pointAY - pointCY;
  //println(vecABX, vecABX1);
  //println(vecABY, vecABY1);
}
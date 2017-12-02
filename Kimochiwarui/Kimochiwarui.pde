void setup (){
  size (500,500);
  background (255);
  frameRate (60);
}

void draw(){
  float X = random(500);
  float Y = random(500);
  
  fill (random(0,250),random(50,255),random(50,255),50);
  ellipse (X, Y, random(30),random(50));

  if (X >=200);
{
  frameRate (500);
  }
}
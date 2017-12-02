import netP5.*;
import oscP5.*;
import ketai.camera.*;

OscP5 oscp5;
NetAddress mypc;
int sendPort = 11451;
int receivePort = 15411;
String sendAddress = "192.168.1.229";
String password = "/501904910jrieo;wjifor;jg;";

KetaiCamera cam;

void setup() {
  oscp5 = new OscP5(this, receivePort);
  mypc = new NetAddress(sendAddress, sendPort);
  oscp5.plug(this,"A",password);
  
  orientation(LANDSCAPE);
  textAlign(CENTER,CENTER);
  textSize(displayDensity * 25);
  cam = new KetaiCamera(this, 1920, 1080, 30);
}

void draw() {
  if(mousePressed) {
    OscMessage myMessage = new OscMessage(password);
    myMessage.add(mouseX);
    myMessage.add(mouseY);
    oscp5.send(myMessage, mypc);
  }
  
  if (cam != null && cam.isStarted()) {
    image(cam, 0, 0, width, height);
    cam.autoSettings();
    color center = get(width/2,height/2);
    color upperRightRed = get(width/2-10,height/2-10);
    text(red(upperRightRed),width/2,height/2);
    text(green(upperRightRed),width/2,height/2-100);
    text(blue(upperRightRed),width/2,height/2-200);
    fill(255);
    ellipse(width/2-10,height/2-10,10,10);
  }
  else
  {
    background(128);
    text("Camera is currently off.", width/2, height/2);
  }
  drawUI();
}

void onCameraPreviewEvent()
{
  cam.read();
}

void mousePressed()
{
  //Toggle Camera on/off
  if (mouseX < width/3 && mouseY < 100)
  {
    if (cam.isStarted())
    {
      cam.stop();
    } else
      cam.start();
  }

  if (mouseX < 2*width/3 && mouseX > width/3 && mouseY < 100)
  {
    if (cam.getNumberOfCameras() > 1)
    {
      cam.setCameraID((cam.getCameraID() + 1 ) % cam.getNumberOfCameras());
    }
  }

  //Toggle Camera Flash
  if (mouseX > 2*width/3 && mouseY < 100)
  {
    if (cam.isFlashEnabled())
      cam.disableFlash();
    else
      cam.enableFlash();
  }
}

void drawUI()
{
  pushStyle();
  textAlign(LEFT);
  fill(0);
  stroke(255);
  rect(0, 0, width/3, 100);
  rect(width/3, 0, width/3, 100);

  rect((width/3)*2, 0, width/3, 100);

  fill(255);
  if (cam.isStarted())
    text("Camera Off", 5, 80); 
  else
    text("Camera On", 5, 80); 

  if (cam.getNumberOfCameras() > 0)
  {
    text("Switch Camera", width/3 + 5, 80);
  }

  if (cam.isFlashEnabled())
    text("Flash Off", width/3*2 + 5, 80); 
  else
    text("Flash On", width/3*2 + 5, 80); 

  popStyle();
}
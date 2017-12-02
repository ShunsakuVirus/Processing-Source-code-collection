String textValue = "UR'UDB2L'D2FF'";






import processing.serial.*;
import netP5.*;
import oscP5.*;
import controlP5.*;


Serial rl;
Serial fb;
Serial uu;

OscP5 oscp5;
boolean isSignal = false;
int receivePort = 11451;
String password = "/501904910jrieo;wjifor;jg;";

ControlP5 cp5;
String nextStr;
String nowStr;
String prevStr;

int delayT = 2000;

void setup() {
  size(700, 400);
  background(0);
  fill(255);
  
  rl = new Serial(this, "COM5", 9600);
  fb = new Serial(this, "COM6", 9600);
  uu = new Serial(this, "COM4", 9600);
  oscp5 = new OscP5(this, receivePort);
  oscp5.plug(this,"A",password);
  
  PFont font = createFont("arial",20);
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("textValue")
     .setPosition(20,170)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     ;
  textFont(font);
  
  
  for(int i=0;i<textValue.length();i++) {
    if(i==0) {
      nowStr = str(textValue.charAt(i)); 
    }
    if(i>0 && i<textValue.length()-1) {
      prevStr = str(textValue.charAt(i-1));
      nowStr = str(textValue.charAt(i));
      nextStr = str(textValue.charAt(i+1));
    } else if(i>0 && (i==textValue.length()-1)) {
      prevStr = str(textValue.charAt(i-1));
      nowStr = str(textValue.charAt(i));
    }
    println(nextStr);
      //--------------------------------------
      if(nowStr.equals("'")) {
        if(prevStr.equals("F")) {
          fb.write(1);
          delay(delayT);
        } else if(prevStr.equals("B")) {
          fb.write(4);
          delay(delayT);
        } else if(prevStr.equals("R")) {
          rl.write(1);
          delay(delayT);
        } else if(prevStr.equals("L")) {
          rl.write(4);
          delay(delayT);
        } else if(prevStr.equals("U")) {
          uu.write(1);
          delay(delayT);
        } else if(prevStr.equals("D")) {
          uu.write(4);
          delay(delayT);
        }
      }
      //--------------------------------------
      if(nowStr.equals("2")) {
        if(prevStr.equals("F")) {
          fb.write(2);
          delay(delayT);
        } else if(prevStr.equals("B")) {
          fb.write(5);
          delay(delayT);
        } else if(prevStr.equals("R")) {
          rl.write(2);
          delay(delayT);
        } else if(prevStr.equals("L")) {
          rl.write(5);
          delay(delayT);
        } else if(prevStr.equals("U")) {
          uu.write(2);
          delay(delayT);
        } else if(prevStr.equals("D")) {
          uu.write(5);
          delay(delayT);
        }
      }
      //---------------------------------------
      //if(nowStr.equals("F")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(0);
      //    delay(delayT);
      //  }
      //}
      //if(nowStr.equals("B")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(3);
      //    delay(delayT);
      //  }
      //}
      //if(nowStr.equals("R")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(0);
      //    delay(delayT);
      //  }
      //}
      //if(nowStr.equals("L")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(3);
      //    delay(delayT);
      //  }
      //}
      //if(nowStr.equals("U")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(0);
      //    delay(delayT);
      //  }
      //}
      //if(nowStr.equals("D")) {
      //  if(nextStr.equals("'")==false && nextStr.equals("2")==false) {
      //    fb.write(3);
      //    delay(delayT);
      //  }
      //}
      //--------------------------------------
    }
  }

//public void A() {
//  if(isSignal) {
//    port2.write(textValue);
//  }
//}

String readFromArduino = "";

void draw() {
  background(0);
  fill(255);
  text(textValue, 360,180);
  //background(0);
  //println(textValue);
}
void serialEvent(Serial p) { 
  readFromArduino = p.readStringUntil('\0');
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
    //fb.write(0);
    //rl.write(0);
    //uu.write(0);
  }
}
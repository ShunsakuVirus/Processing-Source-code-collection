import ddf.minim.*;

PImage img;

Minim minim;
AudioPlayer player;

int scene = 0;

// player_status
float xp = -100, yp = 920;
float xSpeed = 0, ySpeed = 0;
float playerSize = 100;

// stage_status_Rect
float xsr = 2000, ysr = 920;
float stageSize = 100;
// stage_status_triangle
float xst = 2000, yst = 870, xst1 = 1950, yst1 = 970, xst2 = 2050, yst2 = 970;
// floor2.1
float xf = 600;
// background
float xb = 750, yb = 600;
float backg = 10, backg1 = 0, backg2 = 98;

void setup() {
  fullScreen();
  rectMode(CENTER);
  textMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("Geometry Dash.mp3");
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}

void draw() {
  if (scene == 0) {
    background(0, 168, 255);
    textSize(100);
    fill(255);
    text("GAME START", 640, 575);
    fill(255, 255, 255, 0);
    stroke(0);
    strokeWeight(10);
    rect(width / 2, height / 2, 800, 100);
  } else if (scene == 1) {
    background(backg, backg1, backg2, 50);
    
    // floor1
    stroke(255);
    strokeWeight(5);
    fill(0, 255, 255);
    rect(965, 975, width, 10);
  
    // floor2
    stroke(255);
    strokeWeight(5);
    fill(63, 155, 250);
    rect(965, 1030, width, 100);
  
    // floor2.1

    // background
    textSize(100);
    text("Stage 1",xb, yb);
    xb = xb -= xSpeed;
    backg = backg += 0.1;
    if (backg >= 98) {
      backg = 98;
      backg2 = backg2 -= 0.1;
      if (backg2 >= 98) {
        backg2 = 98;
        backg1 = backg1 += 0.1;
         
         
      }
    }
    
    // player
    stroke(0);
    fill(70, 247, 89);
    rect(xp, yp, playerSize, playerSize);
    fill(255);
    rect(xp, yp, playerSize - 50, playerSize - 50);
    fill(45, 225, 247);
    rect(xp, yp, playerSize - 70, playerSize - 70);
    noStroke();
      
    // Stage_triangle
    stroke(0);
    strokeWeight(5);
    fill(5, 18, 242);
    triangle(xst, yst, xst1, yst1, xst2, yst2);                                             //1
    triangle(xst + 1500, yst, xst1 + 1500, yst1, xst2 + 1500, yst2);                        //2
    triangle(xst + 3250, yst - 100, xst1 + 3250, yst1 - 100, xst2 + 3250, yst2 - 100);      //3
    triangle(xst + 4000, yst, xst1 + 4000, yst1, xst2 + 4000, yst2);                        //4
    triangle(xst + 4350, yst, xst1 + 4350, yst1, xst2 + 4350, yst2);                        //5
    triangle(xst + 4450, yst, xst1 + 4450, yst1, xst2 + 4450, yst2);                        //6
    triangle(xst + 7800, yst - 100, xst1 + 7800, yst1 - 100, xst2 + 7800, yst2 - 100);      //7
    triangle(xst + 6800, yst - 100, xst1 + 6800, yst1 - 100, xst2 + 6800, yst2 - 100);      //8
    triangle(xst + 10000, yst, xst1 + 10000, yst1, xst2 + 10000, yst2);                     //9
    triangle(xst + 10100, yst, xst1 + 10100, yst1, xst2 + 10100, yst2);                     //10
    triangle(xst + 10400, yst, xst1 + 10400, yst1, xst2 + 10400, yst2);                     //11
    triangle(xst + 10500, yst, xst1 + 10500, yst1, xst2 + 10500, yst2);                     //12
    triangle(xst + 10900, yst, xst1 + 10900, yst1, xst2 + 10900, yst2);                     //13
    triangle(xst + 11000, yst, xst1 + 11000, yst1, xst2 + 11000, yst2);                     //14
    triangle(xst + 13900, yst, xst1 + 13900, yst1, xst2 + 13900, yst2);                     //15
    triangle(xst + 17200, yst, xst1 + 17200, yst1, xst2 + 17200, yst2);                     //16
    triangle(xst + 17600, yst, xst1 + 17600, yst1, xst2 + 17600, yst2);                     //17
    triangle(xst + 20000, yst, xst1 + 20000, yst1, xst2 + 20000, yst2);                     //18
    triangle(xst + 20100, yst, xst1 + 20100, yst1, xst2 + 20100, yst2);                     //19
    triangle(xst + 20400, yst, xst1 + 20400, yst1, xst2 + 20400, yst2);                     //20
    triangle(xst + 20500, yst, xst1 + 20500, yst1, xst2 + 20500, yst2);                     //21
    triangle(xst + 20800, yst, xst1 + 20800, yst1, xst2 + 20800, yst2);                     //22
    triangle(xst + 20900, yst, xst1 + 20900, yst1, xst2 + 20900, yst2);                     //23
    triangle(xst + 21200, yst, xst1 + 21200, yst1, xst2 + 21200, yst2);                     //24
    triangle(xst + 21300, yst, xst1 + 21300, yst1, xst2 + 21300, yst2);                     //25
    
    xst = xst -xSpeed;
    xst1 = xst1 -xSpeed;
    xst2 = xst2 -xSpeed;
    
    // stage_rect
    stroke(0);
    strokeWeight(5);
    fill(82, 255, 251);
    rect(xsr + 3000, ysr, stageSize + 500, stageSize);                                      //1
    rect(xsr + 4550, ysr - 50, stageSize, stageSize + 100);                                 //2
    rect(xsr + 4950, ysr - 150, stageSize, stageSize + 300);                                //3
    rect(xsr + 6500, ysr, stageSize + 1000, stageSize);                                     //4
    rect(xst + 8000, ysr, stageSize + 1000, stageSize);                                     //5
    rect(xst + 13000, ysr - 50, stageSize, stageSize + 100);                                //6
    rect(xst + 13400, ysr - 150, stageSize, stageSize + 300);                               //7
    rect(xst + 14200, ysr - 50, stageSize, stageSize + 100);                                //8
    rect(xst + 14600, ysr - 150, stageSize, stageSize + 300);                               //9
    rect(xst + 15000, ysr - 250, stageSize, stageSize + 500);                               //10
    rect(xst + 15500, ysr - 150, stageSize, stageSize + 300);                               //11
    rect(xst + 16200, ysr - 50, stageSize, stageSize + 100);                                //12
    rect(xst + 16600, ysr - 50, stageSize, stageSize + 100);                                //13
    rect(xst + 18400, ysr, stageSize, stageSize);                                           //14
    rect(xst + 18900, ysr, stageSize, stageSize);                                           //15
    rect(xst + 19400, ysr, stageSize, stageSize);                                           //16
    xsr = xsr - xSpeed;
    
    // stage_GOAL
    fill(255, 255, 255, 0);
    noStroke();
    rect(xsr +23000, ysr, stageSize, stageSize);
    if (xp + 50 >= xsr + 23000) {  
      scene = 3;
    }    
    // collision_detection_triangle
    if (xp + 50 >= xsr - 50 && xp - 50 <= xsr + 40 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //1
    if (xp + 50 >= xsr + 1450 && xp - 50 <= xsr + 1540 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //2
    if (xp + 50 >= xsr + 3210 && xp - 50 <= xsr + 3300 && yp + 50 >= ysr - 90) {
      scene = 2;
    }                                                                                       //3
    if (xp + 50 >= xsr + 3950 && xp - 50 <= xsr + 4050 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //4
    if (xp + 50 >= xsr + 4320 && xp - 50 <= xsr + 4500 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //5 & 6
    if (xp + 50 >= xsr + 7750 && xp - 50 <= xsr + 7850 && yp + 50 >= ysr - 90) {
      scene = 2;
    }                                                                                       //7
    if (xp + 50 >= xsr + 6750 && xp - 50 <= xsr + 6850 && yp + 50 >= ysr - 90) {
      scene = 2;
    }                                                                                       //8
    if (xp + 50 >= xsr + 9950 && xp - 50 <= xsr + 10130 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //9 & 10
    if (xp + 50 >= xsr + 10370 && xp - 50 <= xsr + 10530 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //11 & 12
    if (xp + 50 >= xsr + 10870 && xp - 50 <= xsr + 11120 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //13 & 14
    if (xp + 50 >= xsr + 13850 && xp - 50 <= xsr + 13930 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //15
    if (xp + 50 >= xsr + 17150 && xp - 50 <= xsr + 17230 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //16
    if (xp + 50 >= xsr + 17550 && xp - 50 <= xsr + 17630 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //17
    if (xp + 50 >= xsr + 19950 && xp - 50 <= xsr + 20030 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //18
    if (xp + 50 >= xsr + 20050 && xp - 50 <= xsr + 20130 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //19
    if (xp + 50 >= xsr + 20350 && xp - 50 <= xsr + 20430 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //20
    if (xp + 50 >= xsr + 20450 && xp - 50 <= xsr + 20530 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //21
    if (xp + 50 >= xsr + 20750 && xp - 50 <= xsr + 20830 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //22
    if (xp + 50 >= xsr + 20850 && xp - 50 <= xsr + 20930 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //23
    if (xp + 50 >= xsr + 21150 && xp - 50 <= xsr + 21230 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //24
    if (xp + 50 >= xsr + 21250 && xp - 50 <= xsr + 21330 && yp + 50 >= ysr - 40) {
      scene = 2;
    }                                                                                       //25
    
    
     
    // collision_detection_rect
    if (xp + 50 >= xsr + 2700 && xp - 50 <= xsr + 3300 && yp == 920) {  
      scene = 2;
    }                                                                                       //1
    if (xp + 50 >= xsr + 4500 && xp - 50 <= xsr + 4600 && yp >= 820) {
      scene = 2;
    }                                                                                       //2
    if (xp + 50 >= xsr + 4900 && xp - 50 <= xsr + 5000 && yp >= 720) {
      scene = 2;
    }                                                                                       //3
    if (xp + 50 >= xsr + 5900 && xp - 50 <= xsr + 7100 && yp == 920) {
      scene = 2;
    }                                                                                       //4
    if (xp + 50 >= xsr + 7400 && xp - 50 <= xsr + 8600 && yp == 920) {
      scene = 2;
    }                                                                                       //5
    if (xp + 50 >= xsr + 12950 && xp - 50 <= xsr + 13050 && yp >= 820) {
      scene = 2;
    }                                                                                       //6
    if (xp + 50 >= xsr + 13350 && xp - 50 <= xsr + 13450 && yp >= 720) {
      scene = 2;
    }                                                                                       //7
    if (xp + 50 >= xsr + 14150 && xp - 50 <= xsr + 14250 && yp >= 820) {
      scene = 2;
    }                                                                                       //8
    if (xp + 50 >= xsr + 14550 && xp - 50 <= xsr + 14650 && yp >= 720) {
      scene = 2;
    }                                                                                       //9
    if (xp + 50 >= xsr + 14950 && xp - 50 <= xsr + 15050 && yp >= 620) {
      scene = 2;
    }                                                                                       //10
    if (xp + 50 >= xsr + 15450 && xp - 50 <= xsr + 15550 && yp >= 720) {
      scene = 2;
    }                                                                                       //11
    if (xp + 50 >= xsr + 16150 && xp - 50 <= xsr + 16250 && yp >= 820) {
      scene = 2;
    }                                                                                       //12
    if (xp + 50 >= xsr + 16550 && xp - 50 <= xsr + 16650 && yp >= 820) {
      scene = 2;
    }                                                                                       //13
    if (xp + 50 >= xsr + 18350 && xp - 50 <= xsr + 18450 && yp >= 920) {
      scene = 2;
    }                                                                                       //14
    if (xp + 50 >= xsr + 18850 && xp - 50 <= xsr + 18950 && yp >= 920) {
      scene = 2;
    }                                                                                       //15
    if (xp + 50 >= xsr + 19350 && xp - 50 <= xsr + 19450 && yp >= 920) {
      scene = 2;
    }                                                                                       //16
     
    // control
    xSpeed = 18;
    
    xp += xSpeed;
    yp += ySpeed;
  
    if (xp > 600) {
      xp = 600;
    }
    
    if (xp + 50 >= xsr + 2730  && xp - 50 <= xsr + 3300 && yp + 50 >= ysr - 50) { 
      yp = 820;
    } else if (xp + 50 >= xsr + 4500 && xp - 50 <= xsr + 4600 && yp + 50 >= ysr - 150) {
      yp = 720;
    } else if (xp + 50 >= xsr + 4900 && xp - 50 <= xsr + 5000 && yp + 50 >= ysr - 350) {
      yp = 520;
    } else if (xp + 50 >= xsr + 5900 && xp - 50 <= xsr + 7100 && yp + 50 >= ysr - 50) {
      yp = 820;
    } else if (xp + 50 >= xsr + 7400 && xp - 50 <= xsr + 8600 && yp + 50 >= ysr - 50) {
      yp = 820;
    } else if (xp + 50 >= xsr + 12950 && xp - 50 <= xsr + 13050 && yp + 50 >= ysr - 150) {
      yp = 720;
    } else if (xp + 50 >= xsr + 13350 && xp - 50 <= xsr + 13450 && yp + 50 >= ysr - 350) {
      yp = 520;
    } else if (xp + 50 >= xsr + 14150 && xp - 50 <= xsr + 14250 && yp + 50 >= ysr - 150) {
      yp = 720;
    } else if (xp + 50 >= xsr + 14550 && xp - 50 <= xsr + 14650 && yp + 50 >= ysr - 350) {
      yp = 520;
    } else if (xp + 50 >= xsr + 14950 && xp - 50 <= xsr + 15050 && yp + 50 >= ysr - 550) {
      yp = 320;
    } else if (xp + 50 >= xsr + 15450 && xp - 50 <= xsr + 15550 && yp + 50 >= ysr - 350) {
      yp = 520;
    } else if (xp + 50 >= xsr + 16150 && xp - 50 <= xsr + 16250 && yp + 50 >= ysr - 150) {
      yp = 720;
    } else if (xp + 50 >= xsr + 16550 && xp - 50 <= xsr + 16650 && yp + 50 >= ysr - 150) {
      yp = 720;
    } else if (xp + 50 >= xsr + 18350 && xp - 50 <= xsr + 18450 && yp + 50 >= ysr - 50) {
      yp = 820;
    } else if (xp + 50 >= xsr + 18850 && xp - 50 <= xsr + 18950 && yp + 50 >= ysr - 50) {
      yp = 820;
    } else if (xp + 50 >= xsr + 19350 && xp - 50 <= xsr + 19450 && yp + 50 >= ysr - 50) {
      yp = 820;
    }
    
    else if (yp > 920) {
      ySpeed = 0;
      yp = 920;
    } else {
      ySpeed += 4;
    }
    
    
  } else if (scene == 2) {
    background(255);
    fill(72, 252, 64);
    text("[R] Retry", 700, height / 3);
    fill(82, 255, 251);
    text("[ESC] Exit", 700, height / 2);
    player.close();
    minim.stop();
  } else if (scene == 3) {
    background(82, 255, 251);
    img = loadImage("co.png");
    image(img, 0, 0);
  }
  
}

void keyPressed() {
  if (scene == 1) {
    if (key == ' ' && yp == 920) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 2730 && xp - 50 <= xsr + 3300 && yp == 820) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 4500 && xp - 50 <= xsr + 4600 && yp == 720) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 4900 && xp - 50 <= xsr + 5000 && yp == 520) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 5900 && xp - 50 <= xsr + 7100 && yp == 820) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 7400 && xp - 50 <= xsr + 8600 && yp == 820) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 12950 && xp - 50 <= xsr + 13050 && yp == 720) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 13350 && xp - 50 <= xsr + 13450 && yp == 520) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 14150 && xp - 50 <= xsr + 14250 && yp == 720) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 14550 && xp - 50 <= xsr + 14650 && yp == 520) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 14950 && xp - 50 <= xsr + 15050 && yp == 320) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 15450 && xp - 50 <= xsr + 15550 && yp == 520) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 16150 && xp - 50 <= xsr + 16250 && yp == 720) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 16550 && xp - 50 <= xsr + 16650 && yp == 720) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 18350 && xp - 50 <= xsr + 18450 && yp == 820) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 18850 && xp - 50 <= xsr + 18950 && yp == 820) {
      ySpeed = -50;
    } else if (key == ' ' && xp + 50 >= xsr + 19350 && xp - 50 <= xsr + 19450 && yp == 820) {
      ySpeed = -50;
    }
  } else if (scene == 2) {
    if (key == 'R' || key == 'r') {
      player.play();
      player.rewind();
      scene = 1;
    } else if (key == ESC) {
      exit();
    }
  } else if (scene == 0) {
    if (key == TAB || key == ENTER || key == 'S' || key == 's')  {
    player.play();
    player.rewind();
    scene = 1;
    }
  }
}
float[][] stacks = new float[360][2];
boolean[] stacked = new boolean[360];
//float[] diameter = new float[360];
FloatList diameter;
int index = 1;
int interval = 6;
int stackedCnt = 0;
boolean complete = false;

void setup() {
  size(500, 500);
  for(int i = 0; i < 360; i++) {
    stacks[i][0] = 0.0F;
    stacks[i][1] = 0.0F;
    stacked[i] = false;
  }
  diameter = new FloatList();
}

void draw() {
  background(255);
  if(complete) {
    background(60, 255, 0);
  }
  for(int i = 0; i < 360-2; i+=2) {
    if(stacked[i] && stacked[i+1]) {
      stroke(0);
      line(stacks[i][0], stacks[i][1], stacks[i+1][0], stacks[i+1][1]);
    }
  }
}

void mousePressed() {
  init();
  stacks[0][0] = mouseX;
  stacks[0][1] = mouseY;
  stacked[0] = true;
  stackedCnt++;
}

void mouseDragged() {
  interval--;
  if(interval < 0) {
    interval = 6;
    stacks[index][0] = mouseX;
    stacks[index][1] = mouseY;
    stacked[index] = true;
    stackedCnt++;
    index++;
    if(index >= 360) {
      index = 1;
    }
    if(stackedCnt > 360) {
      stackedCnt = 360;
    }
  }
}

void mouseReleased() {
  for(int i = 0; i < 360; i++) {
    if(!stacked[i]) break;
    float max = 0.0F;
    for(int j = 0; j < 360; j++) {
      if(!stacked[j]) break;
      if(i == j) continue;
      float diffx = stacks[j][0] - stacks[i][0];
      float diffy = stacks[j][1] - stacks[i][1];
      float diffsq = sq(diffx) + sq(diffy);
      if(max < diffsq) {
        max = diffsq;
      }
    }
    //diameter[i] = sqrt(max);
    diameter.append(sqrt(max));
  }
  diameter.sort();
  int len = diameter.size();
  float median = stackedCnt % 2 == 0 ?
                 (diameter.get(len/2) + diameter.get(len/2+1)) / 2.0F :
                 diameter.get(len/2+1);
  float average = getAverage(diameter);
  println("median = " + median);
  println("average = " + average);
  println("stacked count = " + stackedCnt);
  int matched = 0;
  for(int i = 0; i < stackedCnt; i++) {
    if(abs(median - diameter.get(i)) <= median / 10.0F) {
      println("matching!!");
      matched++;
      if(matched > stackedCnt - stackedCnt / 5) {
        println("stacked count : " + stackedCnt);
        println("dst count : " + (stackedCnt - stackedCnt / 5));
        println("matched count : " + matched);
        println("This is circle!!!");
        complete = true;
        return;
      }
    }
  }
  println("stacked count : " + stackedCnt);
  println("dst count : " + (stackedCnt - stackedCnt / 5));
  println("matched count : " + matched);
}

float getAverage(FloatList list) {
  float result = 0.0F;
  for(int i = 0; i < list.size(); i++) {
    result += list.get(i);
  }
  return result / list.size();
}

void init() {
  for(int i = 0; i < 360; i++) {
    stacks[i][0] = 0.0F;
    stacks[i][1] = 0.0F;
    stacked[i] = false;
  }
  diameter.clear();
  index = 1;
  interval = 6;
  stackedCnt = 0;
  complete = false;
}

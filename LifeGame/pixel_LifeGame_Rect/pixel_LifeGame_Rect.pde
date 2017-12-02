boolean[][] now, next;
int cellw = 10;
int cellh = 10;
int Row;
int Column;
int I;
int J;
int gCount;
void setup() {
  Row = width / cellw;
  Column = height / cellh;
 size(1000, 1000);
 frameRate(10);
 colorMode(HSB, 100);
 now = new boolean[Row][Column];
 next = new boolean[Row][Column];
 for (int i = 0; i < Row; i ++) {
   for (int j = 0; j < Column; j ++) {
       now[i][j] = random(0, 1) < 0.5;
       
   }
 }
}

void update() {
 for (int i = 0; i < Row; i ++) {
   for (int j = 0; j < Column; j ++) {
       boolean up = now[i][(j - 1 + Column) % Column];
       boolean down = now[i][(j + 1) % Column];
       boolean left = now[(i - 1 + Row) % Row][j];
       boolean right = now[(i + 1) % Row][j];
       boolean upperRight = now[(i + 1) % Row][(j - 1 + Column) % Column];
       boolean upperLeft = now[(i - 1 + Row) % Row][(j - 1 + Column) % Column];
       boolean underRight = now[(i + 1) % Row][(j + 1) % Column];
       boolean underLeft = now[(i - 1 + Row) % Row][(j + 1) % Column];
       int count = 0;
       
     if(up) count ++;
     if(down) count ++;
     if(left) count ++;
     if(right) count ++;
     if(upperLeft) count ++;
     if(upperRight) count ++;
     if(underLeft) count ++;
     if(underRight) count ++;
     if (now[i][j]) {
         next[i][j] = count == 2 || count == 3;
     } else {
         next[i][j] = count == 3;
     }
     }
   }
}

void draw() {
 //loadPixels();
 update();
for (int i = 0; i < Row; i ++) {
   for (int j = 0; j < Column; j ++) {
     gCount = color(i, j, 100);
     I = i * cellw;
     J = j * cellh;
     now[i][j] = next[i][j];
     noStroke();
     if (now[i][j]) {
       fill(gCount);
     } else {
       fill(0);
     }
     rect(I, J, cellw, cellh);
   }
 }
 }
 //void mousePressed() {
 //  for (int i = 0; i < Row; i ++) {
 //  for (int j = 0; j < Column; j ++) {
 //    next[i][j] = true;
 //  }
 //  }
 ////updatePixels();
//}//
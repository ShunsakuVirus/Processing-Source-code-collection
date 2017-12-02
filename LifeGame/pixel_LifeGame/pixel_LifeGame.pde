boolean[][] now, next;

void setup() {
 size(500, 500);
 now = new boolean[width][height];
 next = new boolean[width][height];
 for (int i = 0; i < width; i++) {
   for (int j = 0; j < height; j++) {
     if (random(0, 1) < 0.5) {
       now[i][j] = true;
     }
   }
 }
}

void update() {
 for (int i = 0; i < width; i++) {
   for (int j = 0; j < height; j++) {
       boolean up = now[i][(j - 1 + height) % height];
       boolean down = now[i][(j + 1) % height];
       boolean left = now[(i + width - 1) % width][j];
       boolean right = now[(i + 1) % width][j];
       boolean upperRight = now[(i + 1) % width][(j - 1 + height) % height];
       boolean upperLeft = now[(i + width - 1) % width][(j - 1 + height) % height];
       boolean underRight = now[(i + 1) % width][(j + 1) % height];
       boolean underLeft = now[(i + width - 1) % width][(j + 1) % height];
       int count = 0;
     //next[i][j] = now[i][j];
     //next[i][j] = now[(i + 1) % width][(j + 1) % height];
     //next[i][j] = now[(i + 2) % width][(j + 2) % height];
     //next[i][j] = now[(i + width - 1) % width][j];
     //if(now[i][j]) {
     //  next[i][j] = now[(i + width - 1) % width][j];
     //} else if(!now[i][j]) {
     //  next[i][j] = now[(i + 2) % width][(j + 2) % height];
     //}
     //if(!next[i][j]) {
     //  next[i][j] = now[(i + 1) % width][j];
     //}
     if(up) {count ++;}
     if(down) {count ++;}
     if(left) {count ++;}
     if(right) {count ++;}
     if(upperLeft) {count ++;}
     if(upperRight) {count ++;}
     if(underLeft) {count ++;}
     if(underRight) {count ++;}
     if (now[i][j]) {
     if(count == 2 || count == 3) {
         next[i][j] = true;
       } else if (count <= 1) {
         next[i][j] = false;
       } else if (count >= 4) {
         next[i][j] = false;
       }
     } else if(!now[i][j]) {
       if(count == 3) {
         next[i][j] = true;
       }
     }
     }
   }
}

void draw() {
 loadPixels();
 update();
 for (int i = 0; i < width; i++) {
   for (int j = 0; j < height; j++) {
     color c;
     now[i][j] = next[i][j];
     if (now[i][j]) {
       c = color(0);
     } else {
       c = color(255);
     }
     pixels[j*width + i] = c;
   }
 }
 updatePixels();
}
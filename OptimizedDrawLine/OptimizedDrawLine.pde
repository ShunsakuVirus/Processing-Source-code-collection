int start_x, start_y, end_x, end_y;
boolean isClicked = false;
boolean isReleased = false;

void setup() {
  size(500, 500);
  stroke(255);
}

void mouseReleased() {
  isClicked = false;
  isReleased = true;
}

void mousePressed() {
  isClicked = true;
  isReleased = false;
  start_x = mouseX;
  start_y = mouseY;
}

void lineTo(int x1, int y1, int x2, int y2) {
  int dx = abs(x2-x1);
  int dy = abs(y2-y1);
  int dirx =0;
  int diry =0;
  int e = 0;
  int x = x1;
  int y = y1;
    if (x1 < x2) {
      dirx = 1;
    } else {
      dirx = -1;
    }
    if (y1 < y2) {
      diry = 1;
    } else {
      diry = -1;
    }
  while (x != x2 || y != y2) {
    point(x, y);
    if (dy <= dx) {
      x += dirx;
      e += dy;
      if (e >= dx) {
        y += diry;
        e -= dx;
      }
    } else {
      y += diry;
      e += dx;
      if (e >= dy) {
        x += dirx;
        e -= dy;
      }
    }
  }
}

void draw() {
  background(0);
  if (isClicked && !isReleased) {
    end_x = mouseX;
    end_y = mouseY;
    lineTo(start_x, start_y, end_x, end_y);
  }
}
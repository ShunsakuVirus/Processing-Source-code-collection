void setup () {
  size (300, 300);
}

float[] x = new float[100];
float[] y = new float[100];
float[] vx = new float[100];
float[] vy = new float[100];

void draw () {
  background(0, 0, 0);
  
  x [0] = mouseX;
  y [0] = mouseY;
  ellipse(x[0], y[0], 50, 50);
  for (int i = 1; i < x.length; i++){
    vx[i] = 0.1*(x[i - 1] - x[i]);
    vy[i] = 0.1*(y[i - 1] - y[i]);
    x[i] = x[i] + vx[i];
    y[i] = y[i] + vy[i];
    ellipse(x[i], y[i], 50, 50);
  }
}
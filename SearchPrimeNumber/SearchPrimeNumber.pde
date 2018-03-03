void DispNum(int num) {
  if (num < 2) return;
  else if (num % 2 == 0) return;

  double sqrt = sqrt(num);
  for (int i =3; i<=sqrt; i+=2) {
    if (num % i == 0) return;
  }
  println(num);
  if(500*500>num) pixels[num] = color(0);
}

void setup() {
  size(500,500);
  loadPixels();
  for (int i = 1; i <= 250000; i++)
  {
    if (i == 1)  {
      pixels[2] = color(0);
      println("2");
    }
    int num = (i << 2) - 1;
    DispNum(num);
    num = (i << 2) + 1;
    DispNum(num);
  }
  updatePixels();
}
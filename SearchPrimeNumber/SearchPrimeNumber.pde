void DispNum(int num) {
  if (num < 2) return;
  else if (num % 2 == 0) return;

  double sqrt = sqrt(num);
  for (int i =3; i<=sqrt; i+=2) {
    if (num % i == 0) return;
  }
  println(num);
}

void setup() {
  for (int i = 1; i <= 999999; i++)
  {
    if (i == 1) println("2");
    int num = (i << 2) - 1;
    DispNum(num);
    num = (i << 2) + 1;
    DispNum(num);
  }
}
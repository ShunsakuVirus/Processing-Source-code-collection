void DispNum(int num) {
  double sqrt = sqrt(num);
  for(int i = 0;i<storage.size();i++) {
    if(storage.get(i) > sqrt) break;
    if(num % storage.get(i) == 0) return;
  }
  storage.append(num);
  println(num);
  pixels[num] = color(230);
}
IntList storage = new IntList();
void setup() {
  size(500,500);
  background(50);
  loadPixels();
  pixels[2] = color(230);
  storage.append(2);
  println("2");
  for (int i = 1; i <= 500*500; i++) {
    int num = (i << 2) - 1;
    DispNum(num);
    num = (i << 2) + 1;
    DispNum(num);
    if(num > 500*500) break;
  }
  updatePixels();
}

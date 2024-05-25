/*double dikdortgenAlani(double uzunKenar, double kisaKenar) {
  return uzunKenar * kisaKenar;
}

void main() {
  double uzunKenar = 4.76;
  double kisaKenar = 9.54;
  double alan = dikdortgenAlani(uzunKenar, kisaKenar);
  print(alan);
} */

int carp(int a, int b) {
  int ikiylecarp(int x) {
    return x * 2;
  }

  int result = a;
  for (int i = 1; i < b; i++) {
    result = ikiylecarp(result);
  }
  return result;
}

void main() {
  int a = 5;
  int b = 3;

  int sonuc = carp(a, b);
  print(sonuc); 
}


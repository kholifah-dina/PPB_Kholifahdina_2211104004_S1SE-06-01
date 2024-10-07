// Fungsi untuk menghitung FPB (Faktor Persekutuan Terbesar)
int hitungFPB(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

// Fungsi untuk menghitung KPK (Kelipatan Persekutuan Terkecil)
int hitungKPK(int a, int b) {
  return (a * b) ~/ hitungFPB(a, b);
}

void main() {
  int bilangan1 = 12;
  int bilangan2 = 8;

  int kpk = hitungKPK(bilangan1, bilangan2);

  print('Bilangan 1: $bilangan1');
  print('Bilangan 2: $bilangan2');
  print('KPK $bilangan1 dan $bilangan2 = $kpk');
}

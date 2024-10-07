import 'dart:io';

// Fungsi untuk mengecek apakah bilangan prima
bool cekBilanganPrima(int angka) {
  if (angka <= 1) {
    return false; // Bilangan 1 dan di bawahnya bukan bilangan prima
  }
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false; // Jika angka habis dibagi dengan i, maka bukan bilangan prima
    }
  }
  return true; // Jika tidak ditemukan pembagi, maka bilangan prima
}

void main() {
  // Meminta input bilangan bulat dari user
  stdout.write("Masukkan bilangan bulat: ");
  int? bilangan = int.tryParse(stdin.readLineSync()!);

  if (bilangan != null) {
    // Mengecek apakah bilangan prima
    if (cekBilanganPrima(bilangan)) {
      print("$bilangan merupakan bilangan prima");
    } else {
      print("$bilangan bukan bilangan prima");
    }
  } else {
    print("Input tidak valid, harap masukkan bilangan bulat.");
  }
}

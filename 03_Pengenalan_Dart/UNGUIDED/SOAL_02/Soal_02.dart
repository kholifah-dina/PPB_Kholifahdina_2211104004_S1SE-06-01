import 'dart:io';

void main() {
  // Meminta input panjang piramida dari user
  stdout.write("Masukkan panjang piramida: ");
  int? panjang = int.tryParse(stdin.readLineSync()!);

  if (panjang != null && panjang > 0) {
    // Loop untuk membentuk piramida
    for (int i = 1; i <= panjang; i++) {
      // Cetak spasi sebelum bintang (untuk merapikan piramida)
      for (int j = 1; j <= panjang - i; j++) {
        stdout.write(" ");
      }
      // Cetak bintang
      for (int k = 1; k <= 2 * i - 1; k++) {
        stdout.write("*");
      }
      // Pindah ke baris berikutnya
      print("");
    }
  } else {
    print("Input tidak valid, harap masukkan angka yang lebih besar dari 0.");
  }
}

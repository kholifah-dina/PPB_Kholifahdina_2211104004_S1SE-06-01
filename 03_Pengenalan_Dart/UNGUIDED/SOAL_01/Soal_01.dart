import 'dart:io';

// Fungsi untuk mengembalikan grade berdasarkan nilai
String evaluasiNilai(int nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40 && nilai <= 70) {
    return "B";
  } else if (nilai > 0 && nilai <= 40) {
    return "C";
  }
  return ""; // Teks kosong untuk nilai yang tidak valid
}

void main() {
  // Menerima input nilai dari user
  stdout.write("Masukkan nilai: ");
  int? inputNilai = int.tryParse(stdin.readLineSync()!);

  // Mengecek validitas input dan menampilkan hasil
  if (inputNilai != null) {
    String grade = evaluasiNilai(inputNilai);
    if (grade.isNotEmpty) {
      print("Nilai $inputNilai merupakan Nilai $grade");
    } else {
      print("Nilai tidak valid");
    }
  } else {
    print("Input bukan angka yang valid");
  }
}

void cariNilai(int nilaiDicari) {
  // Membuat List 2 dimensi dengan 4 baris
  List<List<int>> list2D = [
    // Baris 1: Kelipatan 5 mulai dari 5
    List.generate(3, (index) => 5 * (index + 1)),
    // Baris 2: Bilangan genap mulai dari 2
    List.generate(4, (index) => 2 * (index + 1)),
    // Baris 3: Bilangan kuadrat dari bilangan asli mulai dari 1
    List.generate(5, (index) => (index + 1) * (index + 1)),
    // Baris 4: Bilangan asli mulai dari 3
    List.generate(6, (index) => 3 + index)
  ];

  // Menampilkan isi List
  print("Isi List:");
  for (var baris in list2D) {
    print(baris.join(' '));
  }

  // Mencari nilai dalam List
  bool ditemukan = false;
  for (var i = 0; i < list2D.length; i++) {
    for (var j = 0; j < list2D[i].length; j++) {
      if (list2D[i][j] == nilaiDicari) {
        print("\nBilangan yang dicari: $nilaiDicari ditemukan pada baris ${i + 1}, kolom ${j + 1}");
        ditemukan = true;
        break;
      }
    }
    if (ditemukan) break;
  }

  if (!ditemukan) {
    print("\nBilangan yang dicari: $nilaiDicari tidak ditemukan dalam List");
  }
}

void main() {
  cariNilai(2);  // Masukkan bilangan yang ingin dicari
}

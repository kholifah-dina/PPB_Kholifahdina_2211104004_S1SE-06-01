// Fungsi untuk mencari nilai dalam List 2 dimensi
void cariNilaiDalamList(int target) {
  // Membuat List 2D sesuai ketentuan
  List<List<int>> list2D = [
    // Baris 1: 3 bilangan kelipatan 5 berurutan mulai dari 5
    List.generate(3, (index) => (index + 1) * 5),
    // Baris 2: 4 bilangan genap berurutan mulai dari 2
    List.generate(4, (index) => 2 * (index + 1)),
    // Baris 3: 5 bilangan kuadrat dari bilangan asli mulai dari 1
    List.generate(5, (index) => (index + 1) * (index + 1)),
    // Baris 4: 6 bilangan asli berurutan mulai dari 3
    List.generate(6, (index) => 3 + index),
  ];

  // Menampilkan isi List 2D
  print('Isi List:');
  for (int i = 0; i < list2D.length; i++) {
    print(list2D[i].join(' '));
  }

  // Mencari nilai yang diberikan
  print('\nBilangan yang dicari: $target');
  bool ditemukan = false;

  for (int i = 0; i < list2D.length; i++) {
    for (int j = 0; j < list2D[i].length; j++) {
      if (list2D[i][j] == target) {
        print('$target berada di:');
        print('baris ${i + 1} kolom ${j + 1}');
        ditemukan = true;
      }
    }
  }

  if (!ditemukan) {
    print('$target tidak ditemukan dalam List.');
  }
}

void main() {
  // Contoh penggunaan fungsi
  cariNilaiDalamList(2);
  print(''); // Pemisah output
  cariNilaiDalamList(5);
}

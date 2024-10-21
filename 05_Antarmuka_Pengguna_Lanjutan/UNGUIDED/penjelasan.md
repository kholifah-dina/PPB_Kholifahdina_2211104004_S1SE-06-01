## Penjelasan Program
Program ini adalah aplikasi Flutter yang menampilkan rekomendasi wisata di Banyumas, Indonesia. Berikut adalah penjelasan tentang struktur dan fungsi dari program ini:

Program ini adalah aplikasi Flutter yang menampilkan rekomendasi wisata di Banyumas, Indonesia. Berikut adalah penjelasan tentang struktur dan fungsi dari program ini:

1. Struktur Dasar
- `main()`: Fungsi utama yang menjalankan aplikasi dengan memanggil `MainApp`.
- `MainApp`: Kelas utama yang merupakan widget Stateless, menampilkan tampilan awal aplikasi.

2. MaterialApp dan Scaffold
-`MaterialApp`: Membungkus aplikasi dengan gaya Material Design dan menonaktifkan banner debug.
- `Scaffold`: Menyediakan struktur dasar visual seperti AppBar dan body.

3. CustomScrollView dan Slivers
- `CustomScrollView`: Menggunakan Slivers untuk menciptakan tampilan yang dapat digulir, yang memungkinkan penggunaan `SliverAppBar` dan `SliverList`.
- `SliverAppBar`: Menampilkan gambar latar belakang yang dapat digulir dengan efek blur, serta judul yang terpusat.

4. BackdropFilter
`BackdropFilter`: Menggunakan efek blur untuk menciptakan tampilan yang menarik pada gambar latar belakang, dengan overlay semi-transparan.

5. **Daftar Wisata
`SliverList`: Menampilkan daftar spot wisata dengan menggunakan `SliverChildBuilderDelegate` untuk membuat item daftar secara dinamis.

6. Widget Kartu Wisata
- `_buildTourCard`: Fungsi yang     membangun setiap kartu untuk menampilkan gambar, judul, deskripsi, dan tombol "Selengkapnya".
  - Gambar: Menggunakan `Image.network` untuk menampilkan gambar dari URL, dengan penanganan kesalahan jika gambar gagal dimuat.
  - Deskripsi: Teks deskripsi wisata dengan batasan jumlah baris yang ditampilkan.

7. Dialog Detail
`_showDetails`: Menampilkan detail wisata dalam dialog ketika tombol "Selengkapnya" ditekan, termasuk gambar dan deskripsi lengkap.

8. Data Wisata
List Data: Tiga list terpisah berisi gambar, judul, dan deskripsi untuk masing-masing spot wisata yang ditampilkan.

9. UI Responsif
Menggunakan `MediaQuery` untuk membuat tampilan responsif, di mana ukuran gambar disesuaikan dengan lebar layar perangkat.

## Screenshoot Aplikasi
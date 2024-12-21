## Tugas Function
Buatlah program Dart yang meminta input berupa sebuah bilangan bulat dari user,
kemudian program akan mengecek apakah bilangan tersebut merupakan bilangan
prima atau bukan.

Sampel Input: 23

Sampel Output: bilangan prima

Sampel Input: 12

Sampel Output: bukan bilangan prima

## Screenshots Hasil Program

![App Screenshot](./Screenshot_Hasil_Soal03.png)

## Penjelasan Program
Kode ini adalah program Dart untuk memeriksa apakah suatu bilangan adalah bilangan prima atau bukan.

### Penjelasan:
1. **Fungsi `cekBilanganPrima`**:
   - Fungsi ini memeriksa apakah angka yang diberikan adalah bilangan prima.
   - Jika angka kurang dari atau sama dengan 1, fungsi langsung mengembalikan `false` karena angka tersebut bukan bilangan prima.
   - Fungsi kemudian memeriksa apakah angka tersebut bisa dibagi dengan angka lain dari 2 hingga setengah dari angka tersebut (`angka ~/ 2`). Jika ditemukan pembagi, maka angka tersebut bukan bilangan prima dan mengembalikan `false`.
   - Jika tidak ditemukan pembagi selain 1 dan angka itu sendiri, fungsi mengembalikan `true`, yang berarti angka tersebut adalah bilangan prima.

2. **Fungsi `main`**:
   - Program meminta input dari pengguna berupa bilangan bulat.
   - Input pengguna kemudian diperiksa apakah valid (bisa diubah menjadi integer). Jika tidak valid, akan muncul pesan kesalahan.
   - Jika valid, program memanggil fungsi `cekBilanganPrima` untuk memeriksa apakah bilangan tersebut prima atau tidak, lalu menampilkan hasilnya.

### Contoh Output:
- Jika pengguna memasukkan `5`, program akan mencetak: `5 merupakan bilangan prima`.
- Jika pengguna memasukkan `8`, program akan mencetak: `8 bukan bilangan prima`. 

Pesan kesalahan akan ditampilkan jika input bukan bilangan bulat yang valid.
## Tugas Looping
Buatlah sebuah program dalam Dart yang menampilkan piramida bintang dengan
menggunakan for loop. Panjang piramida ditentukan oleh input dari user.

## Screenshots Hasil Program

![App Screenshot](./Screenshot_Hasil_Soal02.png)

## Penjelasan Program
Kode ini adalah program Dart yang membentuk piramida menggunakan tanda bintang berdasarkan panjang yang dimasukkan oleh pengguna.

1. **Input panjang piramida**:
   - Program meminta pengguna untuk memasukkan panjang piramida, yang akan digunakan untuk menentukan jumlah baris pada piramida.

2. **Validasi input**:
   - Program memastikan bahwa input adalah angka yang lebih besar dari 0.

3. **Membangun piramida**:
   - Program menggunakan dua loop `for` untuk mencetak piramida:
     - Loop pertama (`for (int i = 1; i <= panjang; i++)`) digunakan untuk membuat setiap baris piramida.
     - Loop kedua (`for (int j = 1; j <= panjang - i; j++)`) mencetak spasi untuk merapikan piramida, agar bintang selalu terletak di tengah.
     - Loop ketiga (`for (int k = 1; k <= 2 * i - 1; k++)`) mencetak bintang pada setiap baris. Jumlah bintang bertambah satu setiap barisnya, sesuai dengan rumus `2 * i - 1`.

4. **Output**:
   - Program akan mencetak piramida ke layar, dengan jumlah baris yang sesuai dengan panjang yang dimasukkan pengguna.
   
5. **Pesan error**:
   - Jika input tidak valid (misalnya, bukan angka atau angka kurang dari atau sama dengan 0), program akan menampilkan pesan kesalahan.

Contoh output untuk panjang piramida 5:
```
    *
   ***
  *****
 *******
*********
```
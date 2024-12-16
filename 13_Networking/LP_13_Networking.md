## Laporan Modul 13 Networking

## GUIDED

## Penjelasan Program
Berikut adalah penjelasan rinci mengenai kode yang diberikan, yang mencakup berbagai bagian dari aplikasi Flutter menggunakan **GetX** sebagai state management. Aplikasi ini memiliki beberapa fitur seperti menambah/ mengurangi angka, menampilkan snackbar, dan menampilkan bottom sheet.

### **1. `main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum13/view/detail_page.dart';
import 'package:praktikum13/view/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(title: 'Belajar GetX')),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
    );
  }
}
```

#### Penjelasan:
- **GetMaterialApp**: Ini adalah pengganti `MaterialApp` untuk menggunakan fitur GetX. `GetMaterialApp` menyediakan beberapa fitur seperti routing, state management, dan sebagainya.
- **initialRoute**: Menentukan rute pertama yang akan dibuka ketika aplikasi dijalankan, yaitu `'/'` yang mengarah ke `MyHomePage`.
- **getPages**: Menentukan daftar halaman beserta nama rutenya. Pada aplikasi ini, terdapat dua halaman: `MyHomePage` (rute `/`) dan `DetailPage` (rute `/detail`).

---

### **2. `my_home_page.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum13/view_model/controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                controller.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/detail');
                  },
                  child: Text('Ke Halaman Detail'))
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getSnackBar,
            tooltip: 'Get Snackbar',
            child: const Icon(Icons.message),
          ),
          FloatingActionButton(
            onPressed: controller.getbottomshet,
            tooltip: 'Get Bottom Sheet',
            child: const Icon(Icons.bolt_outlined),
          ),
        ],
      ),
    );
  }
}
```

#### Penjelasan:
- **Get.put()**: Menginisialisasi controller `CounterController` dan menyimpannya dalam dependency injection. Ini memungkinkan untuk mengaksesnya di seluruh aplikasi menggunakan GetX.
- **Obx**: Widget reaktif dari GetX yang akan membangun ulang bagian ini setiap kali nilai yang terhubung berubah. Dalam hal ini, `counter` yang dikelola oleh `CounterController`.
- **FloatingActionButton**:
  - **Increment**: Menambah nilai counter dengan memanggil `controller.incrementCounter`.
  - **Decrement**: Mengurangi nilai counter dengan memanggil `controller.decrementCounter`.
  - **Get Snackbar**: Memanggil `controller.getSnackBar` untuk menampilkan snackbar dengan pesan.
  - **Get Bottom Sheet**: Memanggil `controller.getbottomshet` untuk menampilkan bottom sheet.
- **Get.toNamed('/detail')**: Navigasi ke halaman DetailPage menggunakan rute yang sudah didefinisikan di `main.dart`.

---

### **3. `detail_page.dart`**

```dart
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
```

#### Penjelasan:
- Halaman ini hanya menampilkan teks "Detail Page" di tengah layar. Halaman ini akan dibuka ketika tombol "Ke Halaman Detail" pada `MyHomePage` ditekan.

---

### **4. `controller.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  // Fungsi untuk menambah
  void incrementCounter() {
    counter++;
  }

  // Fungsi untuk mengurangi
  void decrementCounter() {
    counter--;
  }

  void getSnackBar() {
    Get.snackbar(
      'GetX Snackbr',
      'Ini adalah getX',
      backgroundColor: Colors.amber,
      colorText: Colors.black,
    );
  }

  void getbottomshet() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.green,
        child: const Center(
          child: Text(
            'Ini adalah getX BottomSheet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
```

#### Penjelasan:
- **counter**: Variabel yang dikelola menggunakan **RxInt** (reaktif). Dengan menggunakan `.obs`, variabel ini menjadi reaktif, yang berarti setiap kali nilainya berubah, widget yang mengamati akan diperbarui secara otomatis.
- **incrementCounter**: Fungsi untuk menambah nilai dari `counter`.
- **decrementCounter**: Fungsi untuk mengurangi nilai dari `counter`.
- **getSnackBar**: Menampilkan snackbar dengan pesan menggunakan `Get.snackbar`.
- **getbottomshet**: Menampilkan bottom sheet dengan `Get.bottomSheet` yang berisi pesan.

---

### **Alur Aplikasi:**
1. **Halaman Utama (`MyHomePage`)**: 
   - Menampilkan nilai `counter` yang dapat diubah dengan menekan tombol + atau -.
   - Terdapat tombol untuk menampilkan **snackbar** dan **bottom sheet**.
   - Tombol lainnya membuka halaman **DetailPage**.
   
2. **Halaman Detail (`DetailPage`)**:
   - Hanya menampilkan teks "Detail Page" di tengah layar. Halaman ini dapat diakses dari halaman utama dengan tombol "Ke Halaman Detail".

## Hasil Output Guided
- Tampilan Halaman Awal
![App Screenshot](/folder_img/ss_guided_halamanawal.jpg)
- Tampilan Setelah Ditambah 5
![App Screenshot](/folder_img/ss_guided_plus5.jpg)
- Tampilan Detail Page
![App Screenshot](/folder_img/ss_guided_detailpage.jpg)
- Tampilan Bottom Sheet
![App Screenshot](/folder_img/ss_guided_bottomsheet.jpg)
- Tampilan Snack
![App Screenshot](/folder_img/ss_guided_snackbar.jpg)


## UNGUIDED

## Penjelasan Program
Untuk memperjelas penjelasan dari sisi koding, berikut adalah detail implementasi untuk masing-masing bagian pada **Flutter Note App** menggunakan **GetX** sebagai state management. Program ini dibagi menjadi dua file utama: **home_page.dart** dan **add_note.dart**.

### **1. `home_page.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_note.dart';
import 'controllers/note_controller.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController()); // GetX Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        backgroundColor: Colors.brown[200],
        elevation: 5,
      ),
      body: Obx(() {
        // Mengamati perubahan dalam controller
        if (noteController.notes.isEmpty) {
          return Center(child: Text('No Notes Available'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              var note = noteController.notes[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        note.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(note.description),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          noteController.removeNoteAt(index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNotePage()); // Navigasi ke halaman tambah catatan
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.brown[300],
      ),
    );
  }
}
```

#### **Penjelasan Kode `home_page.dart`**:
1. **Controller**:
   - `NoteController` digunakan untuk menyimpan dan mengelola daftar catatan menggunakan GetX.
   - `Get.put()` digunakan untuk membuat instansi controller dan mengaksesnya di seluruh aplikasi.
   
2. **GridView**:
   - Menampilkan catatan dalam bentuk grid. Setiap item di grid adalah sebuah `Card` dengan informasi judul dan deskripsi.
   
3. **FloatingActionButton**:
   - Tombol "+" akan menavigasi ke halaman tambah catatan (`AddNotePage`).

4. **Obx**:
   - Widget ini digunakan untuk mengamati perubahan pada daftar catatan (`notes`). Setiap perubahan pada `notes` akan otomatis memperbarui UI.

---

### **2. `add_note.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/note_controller.dart';

class AddNotePage extends StatelessWidget {
  final NoteController noteController = Get.find(); // Mengambil instance controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Colors.brown[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                String description = descriptionController.text;

                if (title.isEmpty || description.isEmpty) {
                  Get.snackbar('Error', 'Title and Description cannot be empty',
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  noteController.addNote(title, description); // Menambahkan catatan
                  Get.back(); // Kembali ke halaman utama
                }
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(primary: Colors.brown[300]),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### **Penjelasan Kode `add_note.dart`**:
1. **TextEditingController**:
   - Digunakan untuk mengelola teks yang dimasukkan oleh pengguna pada form.
   
2. **Menambah Catatan**:
   - Setelah form diisi, catatan ditambahkan ke dalam daftar dengan memanggil `noteController.addNote(title, description)`.
   
3. **Snackbar**:
   - Jika judul atau deskripsi kosong, sebuah snackbar akan ditampilkan untuk memberitahukan kesalahan.
   
4. **Navigasi**:
   - Setelah catatan berhasil ditambahkan, `Get.back()` digunakan untuk kembali ke halaman utama (`HomePage`).

---

### **3. `note_controller.dart`**

```dart
import 'package:get/get.dart';

class Note {
  String title;
  String description;

  Note({required this.title, required this.description});
}

class NoteController extends GetxController {
  var notes = <Note>[].obs; // Menyimpan daftar catatan dalam bentuk RxList

  void addNote(String title, String description) {
    notes.add(Note(title: title, description: description)); // Menambahkan catatan baru
  }

  void removeNoteAt(int index) {
    notes.removeAt(index); // Menghapus catatan berdasarkan index
  }
}
```

#### **Penjelasan Kode `note_controller.dart`**:
1. **Note**:
   - Model untuk menyimpan informasi catatan seperti judul dan deskripsi.
   
2. **RxList**:
   - `notes` adalah list reaktif yang disediakan oleh GetX. Setiap perubahan pada list ini otomatis memperbarui UI yang terhubung.
   
3. **Fungsi `addNote` dan `removeNoteAt`**:
   - Fungsi untuk menambah dan menghapus catatan.

## Hasil Output Unguided
- Tampilan Halaman Awal
![App Screenshot](/folder_img/ss_unguided_halamanawal.jpg)
- Tampilan Halaman untuk Menambah Notes
![App Screenshot](/folder_img/ss_unguided_addnote.jpg)
- Tampilan Halaman eror saat title dan description tidak diisi
![App Screenshot](/folder_img/ss_unguided_eror.jpg)
- Tampilan Halaman List Notes yang Sudah Dibuat
![App Screenshot](/folder_img/ss_unguided_listnotes.jpg)
- Tampilan Halaman Saat Salah Satu Notes Dihapus
![App Screenshot](/folder_img/ss_unguided_listafterdelete.jpg)

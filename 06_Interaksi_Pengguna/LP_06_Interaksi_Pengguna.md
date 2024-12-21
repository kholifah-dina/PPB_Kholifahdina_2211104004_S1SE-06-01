## Laporan Modul 6 Interaksi Pengguna

## Guided
## Penjelasan program
Kode ini adalah aplikasi Flutter sederhana yang menampilkan tombol untuk meningkatkan angka dan menampilkannya di layar.

### Penjelasan Kode:
1. **`MyApp` Class**:
   - Kelas ini merupakan widget utama yang memulai aplikasi.
   - `MaterialApp` digunakan untuk mengonfigurasi aplikasi, seperti tema dan halaman utama (`home`).
   - Tema yang digunakan adalah tema dengan warna dasar `deepPurple` dan Material3.

   ```dart
   class MyApp extends StatelessWidget {
     const MyApp({super.key});

     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Flutter Demo',
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           useMaterial3: true,
         ),
         home: const MyHomePage(title: 'Flutter Demo Home Page'),
       );
     }
   }
   ```

2. **`MyHomePage` Class**:
   - Ini adalah halaman utama aplikasi dengan sebuah judul dan tombol untuk menambah nilai.
   - Menampilkan teks yang menjelaskan berapa kali tombol telah ditekan.
   - Ketika tombol ditekan, nilai `_counter` akan bertambah 1.

   ```dart
   class MyHomePage extends StatefulWidget {
     const MyHomePage({super.key, required this.title});

     final String title;

     @override
     State<MyHomePage> createState() => _MyHomePageState();
   }
   ```

3. **`_MyHomePageState` Class**:
   - Berisi logika untuk menangani perubahan nilai `_counter` dan memperbarui tampilan.
   - `setState` digunakan untuk memperbarui UI setiap kali tombol ditekan.
   - Tombol `FloatingActionButton` digunakan untuk menambah nilai `_counter`.

   ```dart
   class _MyHomePageState extends State<MyHomePage> {
     int _counter = 0;

     void _incrementCounter() {
       setState(() {
         _counter++;
       });
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
           title: Text(widget.title),
         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               const Text(
                 'You have pushed the button this many times:',
               ),
               Text(
                 '$_counter',
                 style: Theme.of(context).textTheme.headlineMedium,
               ),
             ],
           ),
         ),
         floatingActionButton: FloatingActionButton(
           onPressed: _incrementCounter,
           tooltip: 'Increment',
           child: const Icon(Icons.add),
         ),
       );
     }
   }
   ```

### Fungsi Utama:
- Menampilkan aplikasi dengan sebuah teks yang menunjukkan jumlah tombol yang telah ditekan.
- Menggunakan `FloatingActionButton` untuk menambah nilai dan memperbarui tampilan setiap kali tombol ditekan.

Outputnya akan menampilkan tombol dengan angka yang meningkat setiap kali ditekan.

## Unguided
## Penjelasan Program
Kode ini adalah aplikasi Flutter yang menggunakan `BottomNavigationBar` untuk navigasi antara tiga halaman: **Beranda**, **Wisata**, dan **Profile**.

### Penjelasan Kode:
1. **`MyApp` Class**:
   - `MyApp` adalah widget utama yang bersifat `Stateful`, karena ada perubahan status dalam aplikasi (yaitu perubahan halaman saat menu navigasi dipilih).
   
   ```dart
   class MyApp extends StatefulWidget {
     const MyApp({Key? key}) : super(key: key);

     @override
     _MyAppState createState() => _MyAppState();
   }
   ```

2. **`_MyAppState` Class**:
   - Kelas ini mengelola status aplikasi, seperti halaman yang sedang dipilih.
   - **`_selectedIndex`** menyimpan indeks halaman yang aktif.
   - **`_nameController`** dan **`_emailController`** adalah kontroler untuk menangani input dari pengguna (Nama dan Email).

   ```dart
   class _MyAppState extends State<MyApp> {
     int _selectedIndex = 0;
     final TextEditingController _nameController = TextEditingController();
     final TextEditingController _emailController = TextEditingController();

     late List<Widget> _pages;

     @override
     void initState() {
       super.initState();
       _pages = [
         // Beranda Page
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               TextField(
                 controller: _nameController,
                 decoration: InputDecoration(
                   labelText: 'Masukkan Nama',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(height: 16),
               TextField(
                 controller: _emailController,
                 decoration: InputDecoration(
                   labelText: 'Masukkan Email',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(height: 16),
               ElevatedButton(
                 onPressed: () {
                   // Print Nama dan Email
                   print("Nama: ${_nameController.text}, Email: ${_emailController.text}");
                 },
                 child: const Text('Submit'),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color.fromARGB(255, 198, 145, 64),
                 ),
               ),
             ],
           ),
         ),
         // Wisata Page
         const Center(child: Text('Ini Halaman Wisata', style: TextStyle(fontSize: 24))),
         // Profile Page
         const Center(child: Text('Ini Halaman Profile', style: TextStyle(fontSize: 24))),
       ];
     }

     void _onItemTapped(int index) {
       setState(() {
         _selectedIndex = index; // Change selected page
       });
     }

     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home: Scaffold(
           appBar: AppBar(
             title: const Text('Latihan Bottom Navigation Bar'),
             backgroundColor: const Color.fromARGB(255, 198, 145, 64),
           ),
           body: _pages[_selectedIndex], // Show the selected page
           bottomNavigationBar: BottomNavigationBar(
             items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                 icon: Icon(Icons.home),
                 label: 'Beranda',
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.map),
                 label: 'Wisata',
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.person),
                 label: 'Profile',
               ),
             ],
             currentIndex: _selectedIndex,
             selectedItemColor: Colors.orange,
             unselectedItemColor: Colors.grey,
             onTap: _onItemTapped, // Handle bottom nav tap
           ),
         ),
       );
     }
   }
   ```

### Fungsi Utama:
1. **Beranda**:
   - Halaman pertama dengan dua input teks (Nama dan Email) dan sebuah tombol `Submit`. Ketika tombol ditekan, nilai yang dimasukkan dicetak di konsol.
   
2. **Wisata**:
   - Halaman kedua yang menampilkan teks sederhana "Ini Halaman Wisata".

3. **Profile**:
   - Halaman ketiga yang menampilkan teks sederhana "Ini Halaman Profile".

4. **Bottom Navigation Bar**:
   - Tiga item dalam `BottomNavigationBar`: `Beranda`, `Wisata`, dan `Profile`.
   - Setiap item memiliki ikon dan label, dan ketika dipilih, aplikasi akan menampilkan halaman yang sesuai.

### Output:
- Aplikasi memiliki navigasi dengan tiga halaman. Pengguna dapat mengubah halaman dengan memilih item di bottom navigation bar.
- Halaman "Beranda" memungkinkan pengguna untuk mengisi dan mengirimkan nama serta email, yang akan dicetak di konsol.

# SS Output Unguided
![app.screenshot](/unguided6.png)
## Laporan Guided & Unguided Modul 11 Firebase & Notifikasi

### Penjelasan Kode dan Fungsinya

#### 1. **Kode `main.dart`**
Kode ini adalah titik awal aplikasi Flutter yang mengonfigurasi Firebase dan menangani pesan dari Firebase Cloud Messaging (FCM).

- **Inisialisasi Firebase**: 
  ```dart
  await Firebase.initializeApp();
  ```
  Menginisialisasi Firebase sebelum aplikasi mulai dijalankan, agar aplikasi dapat menggunakan layanan Firebase, seperti FCM.

- **Handler Pesan di Background**: 
  ```dart
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  ```
  Menangani pesan FCM yang diterima ketika aplikasi berjalan di background atau tertutup. Pesan ini diproses oleh fungsi `_firebaseMessagingBackgroundHandler`.

- **Membuat Channel Notifikasi**: 
  ```dart
  await FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  ```
  Membuat channel notifikasi untuk menampilkan pesan di perangkat Android dengan prioritas tinggi. 

- **Pengaturan Notifikasi di Foreground**: 
  ```dart
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  ```
  Mengatur agar aplikasi menampilkan notifikasi secara visual, suara, dan badge ketika aplikasi sedang aktif di foreground.

#### 2. **Kode `my_notification_screen.dart`**
Kode ini menangani tampilan layar notifikasi dan cara aplikasi menangani pesan FCM.

- **Inisialisasi Notifikasi Lokal**: 
  ```dart
  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  ```
  Menyiapkan pengaturan untuk menampilkan notifikasi lokal pada perangkat Android menggunakan gambar ikon aplikasi.

- **Mendengarkan Pesan Masuk (Foreground)**:
  ```dart
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {...});
  ```
  Fungsi ini mendengarkan pesan yang diterima saat aplikasi aktif. Ketika pesan diterima, aplikasi menampilkan notifikasi lokal menggunakan `FlutterLocalNotificationsPlugin`.

- **Menangani Notifikasi yang Dibuka**:
  ```dart
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {...});
  ```
  Fungsi ini menangani aksi ketika pengguna membuka notifikasi, seperti menampilkan dialog berisi pesan yang diterima.

- **Mengambil Token FCM**:
  ```dart
  token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token');
  ```
  Mendapatkan token unik untuk perangkat yang digunakan agar aplikasi dapat mengirim pesan atau notifikasi ke perangkat tertentu.

#### 3. **Penjelasan Singkat**

**Firebase Cloud Messaging (FCM)** adalah layanan dari Google untuk mengirimkan pesan dan notifikasi secara real-time ke perangkat pengguna, baik aplikasi dalam keadaan aktif atau tidak. 

Pada aplikasi ini, FCM digunakan untuk:
- **Mengirim Notifikasi**: Pesan dapat dikirim dan diterima dalam aplikasi. Notifikasi lokal ditampilkan di perangkat menggunakan `flutter_local_notifications`.
- **Menangani Pesan di Foreground dan Background**: Aplikasi menangani pesan FCM yang diterima baik saat aplikasi aktif (foreground) atau tidak aktif (background).
- **Token Perangkat**: Setiap perangkat memiliki token unik yang digunakan untuk mengidentifikasi dan mengirimkan pesan atau notifikasi ke perangkat tersebut.

Dengan FCM, aplikasi dapat terus terhubung dengan penggunanya, memberikan pembaruan atau informasi penting, meskipun aplikasi tidak aktif.

## SS Ouput Guided
![App Screenshot](/folder_img/ss_page_awal.jpg)
![App Screenshot](/folder_img/ss_guided.jpg)

## SS Output Unguided
![App Screenshot](/folder_img/ss_unguided.jpg) 
![App Screenshot](/folder_img/ss_unguided2.jpg)

## Penjelasan Program
Firebase Cloud Messaging (FCM) adalah layanan yang memungkinkan pengiriman notifikasi dan pesan secara real-time ke perangkat pengguna. Layanan ini mendukung berbagai platform, seperti Android, iOS, dan web, serta sering digunakan untuk meningkatkan interaksi aplikasi dengan pengguna. Dengan FCM, pengembang dapat mengirimkan pesan berbasis data atau notifikasi langsung ke perangkat tertentu atau kelompok pengguna.

Notifikasi yang dikirimkan bisa berupa pengingat, informasi promosi, atau pembaruan penting yang ditampilkan di perangkat pengguna, bahkan ketika aplikasi sedang tidak aktif. Selain mudah diintegrasikan, FCM juga mendukung personalisasi dan segmentasi audiens untuk memastikan pesan yang dikirim relevan dengan kebutuhan pengguna.
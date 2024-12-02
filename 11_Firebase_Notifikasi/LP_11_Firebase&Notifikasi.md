## Laporan Guided & Unguided Modul 11 Firebase & Notifikasi

1. Kode main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guide11/my_notification_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description:
      'This channel is used for important notifications.', //Deskripsi Channel
  importance: Importance.high, // Prioritas
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNotificationScreen(),
    );
  }
}

    2. Kode my_notification_screen

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guide11/main.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);
// Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

// Jika notifikasi tersedia, tampilkan menggunakan notifikasi lokal
      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode, // ID notifikasi (hashCode untuk unik)
          notification.title, // Judul notifikasi
          notification.body, // Isi notifikasi
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: "@mipmap/ic_launcher",
            ),
          ),
        );
      }
    });

// Menangani aksi ketika notifikasi dibuka
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
// Jika notifikasi tersedia, tampilkan dialog
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""), // Judul dialog
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? "")], // Isi dialog
                ),
              ),
            );
          },
        );
      }
    });

// Memanggil metode untuk mengambil token FCM perangkat
    getToken();
  }

// Metode untuk mendapatkan token FCM
  void getToken() async {
    token = await FirebaseMessaging.instance
        .getToken(); // Mendapatkan token FCM perangkat
    print('FCM Token: $token'); // Menampilkan token di log
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notification Screen'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Mendapatkan Notifikasi'),
      ),
    );
  }
}

## SS Ouput Guided
![App Screenshot](/folder_img/ss_page_awal.jpg)
![App Screenshot](/folder_img/ss_guided.jpg)

## SS Output Unguided
![App Screenshot](/folder_img/ss_unguided.jpg) 
![App Screenshot](/folder_img/ss_unguided2.jpg)

## Penjelasan Program
Firebase Cloud Messaging (FCM) adalah layanan yang memungkinkan pengiriman notifikasi dan pesan secara real-time ke perangkat pengguna. Layanan ini mendukung berbagai platform, seperti Android, iOS, dan web, serta sering digunakan untuk meningkatkan interaksi aplikasi dengan pengguna. Dengan FCM, pengembang dapat mengirimkan pesan berbasis data atau notifikasi langsung ke perangkat tertentu atau kelompok pengguna.

Notifikasi yang dikirimkan bisa berupa pengingat, informasi promosi, atau pembaruan penting yang ditampilkan di perangkat pengguna, bahkan ketika aplikasi sedang tidak aktif. Selain mudah diintegrasikan, FCM juga mendukung personalisasi dan segmentasi audiens untuk memastikan pesan yang dikirim relevan dengan kebutuhan pengguna.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:santafi/ArtikelPage.dart';
import 'package:santafi/TentangKamiPage.dart';

import 'package:santafi/beranda.dart';
import 'package:santafi/destinasi.dart';
import 'package:firebase_core/firebase_core.dart';

const String montserrat = 'Montserrat';
const String plusjakartasans = 'PlusJakartaSans';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyAq6lAp1C5wK8D_RePqj-2WsBQNehK8zkw",
        authDomain: "santafi-web.firebaseapp.com",
        projectId: "santafi-web",
        storageBucket: "santafi-web.appspot.com",
        messagingSenderId: "225174146950",
        appId: "1:225174146950:web:55ee3aa47ec6af41a5a607",
        measurementId: "G-BLX3KYCLBJ"));
  } else{
    Firebase.initializeApp();
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const BerandaPage(tahun: '2024', kategori: 'Default Category'),
        '/Destinasi': (context) => const DestinasiPage(tahun: '2024', kategori: 'Default Category', bulan: 'Pilih Bulan',),
        '/TentangKami': (context) => const TentangKamiPage(),
        '/Artikel': (context) => const ArtikelPage(),
      },
    ),
  );
}




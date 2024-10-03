import 'package:absen_modul/screens/absensi_screen.dart';
import 'package:absen_modul/screens/izincuti_screen.dart';
import 'package:absen_modul/screens/login_screen.dart';
import 'package:absen_modul/screens/pengumuman_screen.dart';
import 'package:absen_modul/screens/slipgaji_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const LoginScreen(), // Nama kelas harus konsisten dengan yang ada di file login_Screen.dart
      routes: {
        '/absensi': (context) => const AbsensiScreen(),
        '/izincuti': (context) => IzincutiScreen(),
        '/pengumuman': (context) => const PengumumanScreen(),
        '/slipgaji': (context) => const SlipGajiScreen(),
        // '/PaymentPage': (context) => PaymentPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:absen_modul/widget/izincuti_from_widget.dart';

class IzincutiScreen extends StatefulWidget {
  const IzincutiScreen({super.key});

  @override
  State<IzincutiScreen> createState() => _IzincutiScreenState();
}

class _IzincutiScreenState extends State<IzincutiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Izin Cuti'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: IzincutiForm(), // Gunakan widget form yang telah Anda buat
        ),
      ),
    );
  }
}

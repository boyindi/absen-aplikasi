import 'package:absen_modul/widget/slipgaji_widget.dart';
import 'package:flutter/material.dart';
// Pastikan path sudah benar

class SlipGajiScreen extends StatefulWidget {
  const SlipGajiScreen({super.key});

  @override
  State<SlipGajiScreen> createState() => _SlipGajiScreenState();
}

class _SlipGajiScreenState extends State<SlipGajiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Slip Gaji'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SlipGajiForm(), // Use the custom form widget
      ),
    );
  }
}

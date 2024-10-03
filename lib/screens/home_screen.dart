// Mengimpor package yang dibutuhkan
import 'package:absen_modul/widget/buttom_navigationbar_widget.dart'; // Mengimpor widget BottomNavigationBarWidget
import 'package:absen_modul/widget/carousel_widget.dart'; // Mengimpor widget CarouselWidget
import 'package:absen_modul/widget/grid_menu_widget.dart'; // Mengimpor widget GridMenuWidget
import 'package:flutter/material.dart'; // Mengimpor package material design dari Flutter

// Mendefinisikan widget HomeScreen yang bersifat StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor dari HomeScreen

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Membuat State untuk HomeScreen
}

// State untuk widget HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Variabel untuk menyimpan indeks tab yang dipilih

  // Fungsi untuk mengubah tab yang dipilih
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah state _selectedIndex
    });
  }

  // Fungsi build untuk membangun tampilan HomeScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ), // Menampilkan AppBar dengan judul
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Menampilkan widget carousel
            CarouselWidget(), // Widget untuk menampilkan carousel

            // Menambahkan ruang kosong setinggi 20 piksel untuk memberikan jarak antara carousel dan grid menu
            const SizedBox(height: 20), // Widget untuk memberikan jarak

            // Menampilkan widget grid menu dengan padding 8 piksel di sekelilingnya
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridMenuWidget(), // Widget untuk menampilkan grid menu
            ),
          ],
        ),
      ),
      // Menampilkan BottomNavigationBar
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex, // Indeks tab yang dipilih saat ini
        onTabSelected: _onTabSelected, // Fungsi untuk menangani perubahan tab
      ),
    );
  }
}

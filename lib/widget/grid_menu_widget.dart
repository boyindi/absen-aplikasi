import 'package:flutter/material.dart';

class GridMenuWidget extends StatelessWidget {
  final List<String> catNames = [
    "Absensi",
    "Izin&Cuti",
    "Slipgaji",
    "Pengumuman",
  ];

  final List<String> catImages = [
    'lib/images/absen.png',
    'lib/images/app.png',
    'lib/images/planning_10415739.png',
    'lib/images/news (2).png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: catNames.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            switch (catNames[index]) {
              case "Absensi":
                Navigator.pushNamed(context, '/absensi');
                break;
              case "Izin&Cuti":
                Navigator.pushNamed(context, '/izincuti');
                break;
              case "Pengumuman":
                Navigator.pushNamed(context, '/pengumuman');
                break;
              case "Slipgaji":
                Navigator.pushNamed(context, '/slipgaji');
                break;
              case "":
                Navigator.pushNamed(context, '');
                break;
              // Tambahkan navigasi untuk item lain sesuai kebutuhan
              default:
                break;
            }
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 50, // Set the desired width
                  height: 50, // Set the desired height
                  child: Image.asset(catImages[index % catImages.length]),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                catNames[index % catNames.length],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class IzincutiForm extends StatefulWidget {
  const IzincutiForm({super.key});

  @override
  State<IzincutiForm> createState() => _IzincutiFormState();
}

class _IzincutiFormState extends State<IzincutiForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _izinController =
      TextEditingController(); // Controller untuk izin

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextField(
            controller: _nameController,
            labelText: 'Nama', // Ini adalah input untuk nama
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama harus diisi';
              }
              return null;
            },
            fontSize: 16.0, // Ukuran teks untuk nama
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _positionController,
            labelText: 'Jabatan', // Ini adalah input untuk jabatan
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Jabatan harus diisi';
              }
              return null;
            },
            fontSize: 14.0, // Ukuran teks untuk jabatan
          ),
          const SizedBox(height: 16),
          // Input untuk izin
          _buildTextField(
            controller: _izinController,
            labelText: 'Izin', // Label untuk input izin
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Izin harus diisi';
              }
              return null;
            },
            fontSize: 16.0, // Ukuran teks untuk izin
          ),
          const SizedBox(height: 16),
          // Perbesar input teks di bagian "Alasan Cuti"
          _buildTextField(
            controller: _reasonController,
            labelText: 'Alasan Cuti',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Alasan cuti harus diisi';
              }
              return null;
            },
            maxLines: 5, // Tambahkan ini untuk memperbesar input teks
          ),
          const SizedBox(height: 16),
          // Atur ukuran panjang tombol submit
          SizedBox(
            width: double.infinity, // Atur lebar sesuai kebutuhan
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    int maxLines = 1, // Tambahkan parameter default untuk maxLines
    double fontSize = 16.0, // Tambahkan parameter untuk ukuran teks
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      maxLines: maxLines, // Gunakan parameter maxLines
      style: TextStyle(fontSize: fontSize), // Atur ukuran teks
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() == true) {
      // Implementasi penyimpanan data atau pengiriman form
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form berhasil disubmit')),
      );
    }
  }
}

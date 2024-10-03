import 'dart:io';
import 'package:absen_modul/widget/camera_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AbsensiForm extends StatefulWidget {
  const AbsensiForm({Key? key}) : super(key: key);

  @override
  State<AbsensiForm> createState() => _AbsensiFormState();
}

class _AbsensiFormState extends State<AbsensiForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeInController =
      TextEditingController(); // Controller untuk jam masuk
  final TextEditingController _timeOutController =
      TextEditingController(); // Controller untuk jam keluar
  File? _image; // Variabel untuk menyimpan gambar

  final MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'\d')},
  );

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _timeInController.dispose(); // Membersihkan controller untuk jam masuk
    _timeOutController.dispose(); // Membersihkan controller untuk jam keluar
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final date = _dateController.text;
      final timeIn = _timeInController.text; // Mendapatkan nilai jam masuk
      final timeOut = _timeOutController.text; // Mendapatkan nilai jam keluar

      print('Name: $name');
      print('Date: $date');
      print('Time In: $timeIn'); // Menampilkan nilai jam masuk
      print('Time Out: $timeOut'); // Menampilkan nilai jam keluar
      if (_image != null) {
        print('Image Path: ${_image!.path}'); // Menampilkan path gambar
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Absensi berhasil disimpan!'),
        ),
      );

      _nameController.clear();
      _dateController.clear();
      _timeInController.clear(); // Membersihkan field untuk jam masuk
      _timeOutController.clear(); // Membersihkan field untuk jam keluar
      setState(() {
        _image = null; // Membersihkan gambar
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final formattedDate =
          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      _dateController.text = formattedDate;
    }
  }

  Future<void> _pickTime(TextEditingController controller) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      final formattedTime =
          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
      controller.text = formattedTime;
    }
  }

  void _onImageSelected(File image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absensi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameField(), // Widget untuk input nama
                const SizedBox(height: 16.0),
                _buildDateField(), // Widget untuk input tanggal masuk
                const SizedBox(height: 16.0),
                _buildTimeFields(), // Widget untuk input jam masuk dan jam keluar
                const SizedBox(height: 16.0),
                CameraInput(
                    onImageSelected:
                        _onImageSelected), // Widget untuk input kamera
                const SizedBox(height: 16.0),
                _buildSubmitButton(), // Widget untuk tombol submit
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: _pickDate,
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateController,
          decoration: const InputDecoration(
            labelText: 'Tanggal Masuk (DD/MM/YYYY)',
            border: OutlineInputBorder(),
          ),
          inputFormatters: [dateMaskFormatter],
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tanggal tidak boleh kosong';
            }
            if (!RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$')
                .hasMatch(value)) {
              return 'Format tanggal salah';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildTimeFields() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _pickTime(_timeInController),
            child: AbsorbPointer(
              child: TextFormField(
                controller: _timeInController,
                decoration: const InputDecoration(
                  labelText: 'Jam Masuk (HH:MM)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jam Masuk tidak boleh kosong';
                  }
                  if (!RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$')
                      .hasMatch(value)) {
                    return 'Format jam salah';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: GestureDetector(
            onTap: () => _pickTime(_timeOutController),
            child: AbsorbPointer(
              child: TextFormField(
                controller: _timeOutController,
                decoration: const InputDecoration(
                  labelText: 'Jam Keluar (HH:MM)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jam Keluar tidak boleh kosong';
                  }
                  if (!RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$')
                      .hasMatch(value)) {
                    return 'Format jam salah';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _submitForm,
        child: const Text('Simpan'),
      ),
    );
  }
}

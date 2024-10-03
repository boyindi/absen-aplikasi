import 'package:flutter/material.dart';

class SlipGajiForm extends StatefulWidget {
  const SlipGajiForm({super.key});

  @override
  State<SlipGajiForm> createState() => _SlipGajiFormState();
}

class _SlipGajiFormState extends State<SlipGajiForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextField(
            controller: _nameController,
            labelText: 'Nama',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama harus diisi';
              }
              return null;
            },
            fontSize: 16.0,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _positionController,
            labelText: 'Jabatan',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Jabatan harus diisi';
              }
              return null;
            },
            fontSize: 14.0,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _salaryController,
            labelText: 'Gaji',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Gaji harus diisi';
              }
              return null;
            },
            fontSize: 16.0,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          _buildDateField(
            controller: _dateController,
            labelText: 'Tanggal',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tanggal harus diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
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
    int maxLines = 1,
    double fontSize = 16.0,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      maxLines: maxLines,
      style: TextStyle(fontSize: fontSize),
      keyboardType: keyboardType,
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
      ),
      readOnly: true,
      validator: validator,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() == true) {
      // Retrieve text from TextControllers
      String name = _nameController.text;
      String position = _positionController.text;
      String salary = _salaryController.text;
      String date = _dateController.text;

      // Print the values to console
      print("Nama: $name");
      print("Jabatan: $position");
      print("Gaji: $salary");
      print("Tanggal: $date");

      // Display a snackbar with success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form berhasil disubmit')),
      );

      // Reset form fields
      _formKey.currentState?.reset();
    }
  }
}

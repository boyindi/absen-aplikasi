import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadImage(String userId, String imagePath) async {
  // Baca gambar dari path
  final bytes = await File(imagePath).readAsBytes();
  final base64Image = base64Encode(bytes);

  final response = await http.post(
    Uri.parse('http://your_backend_url/api/upload_image'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'user_id': userId,
      'image_base64': base64Image,
    }),
  );

  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Failed to upload image');
  }
}

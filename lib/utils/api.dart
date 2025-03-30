import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future<Uint8List?> fetchImage(String prompt) async {
  try {
    final response = await http.get(
      Uri.parse("https://goribli-hhhsehffeee9a0gr.southeastasia-01.azurewebsites.net/api/$prompt"),
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}

import 'package:http/http.dart' as http;

Future<bool> sendMessage(
    {required String name,
    required String email,
    required String message}) async {
  const url = 'http://api.himanshusharma.tech/send/';
  final response = await http.post(Uri.parse(url),
      body: {"name": name, "message": message, "email": email});
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

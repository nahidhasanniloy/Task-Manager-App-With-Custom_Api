import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<Map<String, dynamic>?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("accessToken");

  if (token != null) {
    // Decode JWT token
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    // Example: you can get name, email, role if present
    print("Decoded Token grt: $decodedToken");
    return decodedToken;
  }
  return null;
}


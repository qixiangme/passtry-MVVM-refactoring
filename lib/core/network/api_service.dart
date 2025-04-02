import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://example.com/api/";

  Future<dynamic> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse("$baseUrl$endpoint"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("GET 요청 실패: ${response.body}");
    }
  }

  Future<dynamic> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("POST 요청 실패: ${response.body}");
    }
  }

  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse("$baseUrl$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("PUT 요청 실패: ${response.body}");
    }
  }
}

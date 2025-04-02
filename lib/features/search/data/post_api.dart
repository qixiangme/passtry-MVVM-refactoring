import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostApi {
  final String baseUrl = "http://10.0.2.2:8000"; // 후에 설정정

  Future<bool> uploadPost(PostModel post) async {
    final url = Uri.parse("$baseUrl/posts");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()),
      );

      if (response.statusCode == 201) {
        print("게시글 업로드 성공");
        return true;
      } else {
        print("게시글 업로드 실패: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("게시글 업로드 실패: $e");
      return false;
    }
  }
}

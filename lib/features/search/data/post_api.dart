import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostApi {
  final String baseUrl = "http://34.64.233.128:5200"; // 후에 설정정

  Future<bool> increasedViewCount(int postId) async {
    final url = Uri.parse("$baseUrl/posts/$postId/views");

    try {
      final response = await http.patch(
        url,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        print("✅ 조회수 증가 성공!");
        return true;
      } else {
        print("❌ 조회수 증가 실패: ${response.body}");
        return false;
      }
    } catch (e) {
      print("🚨 오류 발생: $e");
      return false;
    }
  }

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

  Future<String?> uploadImage(File image) async {
    try {
      // 서버에 이미지 업로드 요청
      final request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/posts"), // 서버 URL로 변경
      );
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseBody);
        return jsonResponse['imageUrl']; // 서버에서 반환된 이미지 URL
      } else {
        print("이미지 업로드 실패: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("이미지 업로드 중 오류 발생: $e");
      return null;
    }
  }
}

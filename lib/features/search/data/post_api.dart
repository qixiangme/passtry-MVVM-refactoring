import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostApi {
  final String baseUrl = "http://34.64.233.128:5200"; // 후에 설정정
  Future<bool> uploadPostWithFile(PostModel post) async {
    final url = Uri.parse("$baseUrl/posts");

    try {
      final request = http.MultipartRequest('POST', url);

      // 텍스트 필드 추가
      request.fields['userId'] = post.userId;
      request.fields['title'] = post.title;
      request.fields['content'] = post.content;
      request.fields['createdAt'] = post.createdAt;
      request.fields['views'] = jsonEncode(post.views);
      request.fields['tags'] = jsonEncode(post.tags); // 태그를 JSON 문자열로 변환

      if (post.images != null && post.images!.existsSync()) {
        request.files.add(
          await http.MultipartFile.fromPath('image', post.images!.path),
        );
        print("이미지 파일 추가됨: ${post.images!.path}");
      } else {
        print("⚠️ 이미지 파일이 존재하지 않습니다.");
      }

      // 헤더 추가

      // 요청 전송
      final response = await request.send().timeout(Duration(seconds: 10));

      // 응답 처리
      if (response.statusCode == 201) {
        print("게시글 업로드 성공");
        return true;
      } else {
        final responseBody = response.stream.bytesToString();
        print("게시글 업로드 실패: ${response.statusCode}");
        print("서버 응답: $responseBody");
        return false;
      }
    } catch (e) {
      print("게시글 업로드 중 오류 발생: $e");
      return false;
    }
  }



}

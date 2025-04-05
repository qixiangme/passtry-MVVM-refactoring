import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class SortApi {
  final String baseUrl = "http://34.64.233.128:5200"; // Base URL 설정

  Future<List<PostModel>> sortPosts({
    int page = 0, // 기본값
    String sort = "recent", // 기본 정렬 방식
    int size = 5, // 페이지 크기
  }) async {
    // 요청 URL 생성
    final url = Uri.parse('$baseUrl/posts').replace(
      queryParameters: {
        'sort': sort,
        'page': page.toString(),
        'size': size.toString(),
      },
    );

    print("Request URL: $url"); // 디버깅용 URL 출력

    try {
      // HTTP GET 요청
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        final responseBodyBytes = response.bodyBytes; // 바이트 형태로 받기
        final responseBodyString = utf8.decode(responseBodyBytes); // UTF-8로 디코딩
        final data = json.decode(responseBodyString);
        List<PostModel> sortedPosts = [];
        for (var item in data) {
          sortedPosts.add(PostModel.fromJson(item));
        }
        return sortedPosts;
      } else {
        print("Response body: ${response.body}");
        throw Exception('정렬된 게시글 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      // 네트워크 또는 기타 에러 처리
      print("Error occurred: $e");
      throw Exception('정렬된 게시글 요청 중 에러 발생');
    }
  }
}
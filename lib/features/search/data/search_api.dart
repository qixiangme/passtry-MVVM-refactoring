import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class SearchApi {
  final String baseUrl = "http://34.64.233.128:5200"; // 후에 설정

  Future<List<PostModel>> searchPosts(String query, {
    int page = 0,
    int size = 5, // size 추가
  }) async {
    final url = Uri.parse('$baseUrl/posts/search').replace(
      queryParameters: {
        'query': query,
        'page': page.toString(),
        'size': size.toString(), // size 추가
      },
    );

    print("Request URL: $url");

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBodyBytes = response.bodyBytes; // 바이트 형태로 받기
      final responseBodyString = utf8.decode(responseBodyBytes); // UTF-8로 디코딩
      final data = json.decode(responseBodyString);
      List<PostModel> searchResults = [];
      for (var item in data) {
        searchResults.add(PostModel.fromJson(item));
      }
      return searchResults;
    } else {
      print("Response body: ${response.body}");
      throw Exception('검색 요청 실패: ${response.statusCode}');
    }
  }
}

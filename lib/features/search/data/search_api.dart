import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class SearchApi {
  final String baseUrl = "http://10.0.2.2:8000"; // 후에 설정정

  Future<List<PostModel>> searchPosts(
    String query, {
    int page = 1,
    String tag = "latest",
  }) async {
    final url = Uri.parse('$baseUrl/search').replace(
      //후에 엔드포인트 설정
      queryParameters: {'query': query, 'page': page.toString(), 'tag': tag},
    );

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PostModel> searchResults = [];
      for (var item in data['results']) {
        searchResults.add(PostModel.fromJson(item));
      }
      return searchResults;
    } else {
      throw Exception('검색 요청 실패: ${response.statusCode}');
    }
  }
}

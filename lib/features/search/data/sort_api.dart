import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class SortApi {
  final String baseUrl = "http://34.64.233.128:5200"; // 후에 BaseUrl 설정

  Future<List<PostModel>> sortPosts({
    //기본값
    int page = 0,
    String sort = "recent",
    int size = 5,
  }) async {
    final url = Uri.parse('$baseUrl/posts?sort=$sort&page=$page&size=5');
    print("Request URL: $url");

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PostModel> sortedPosts = [];
      for (var item in data) {
        sortedPosts.add(PostModel.fromJson(item));
      }
      return sortedPosts;
    } else {
      throw Exception('정렬된 게시글 요청 실패: ${response.statusCode}');
    }
  }
}

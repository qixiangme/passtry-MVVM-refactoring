import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class SortApi {
  final String baseUrl = "https://example.com/api"; // 후에 BaseUrl 설정

  Future<List<PostModel>> sortPosts({int page = 1, String sort = "latest"}) async {
    final url = Uri.parse('$baseUrl/posts').replace(queryParameters: {
      'page': page.toString(),
      'sort': sort,  //태그로 정렬
    });

    final response = await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PostModel> sortedPosts = [];
      for (var item in data['results']) {
        sortedPosts.add(PostModel.fromJson(item)); 
      }
      return sortedPosts;
    } else {
      throw Exception('정렬된 게시글 요청 실패: ${response.statusCode}');
    }
  }
}

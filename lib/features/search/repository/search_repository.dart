import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/search_api.dart';

class SearchRepository {
  final SearchApi searchApi;

  SearchRepository(this.searchApi);

  Future<List<PostModel>> searchPosts(String query, {int page = 1, String tag = "latest"}) async { //기본값 최신순순
    try {
      return await searchApi.searchPosts(query, page: page, tag: tag);
    } catch (e) {
      throw Exception('검색 실패: $e');
    }
  }
}

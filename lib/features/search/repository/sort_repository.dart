import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/sort_api.dart';

class SortRepository {
  final SortApi sortApi;

  SortRepository(this.sortApi);

  Future<List<PostModel>> sortPosts({String tag = "latest"}) async { //기본값 최신순순
    try {
      return await sortApi.sortPosts(tag: tag);
    } catch (e) {
      throw Exception('정렬 실패: $e');
    }
  }
}
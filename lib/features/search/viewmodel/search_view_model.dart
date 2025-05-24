import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/sort_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  final SortApi sortApi;
  SearchViewModel(this.sortApi) : super(SearchState.initial()) {
    fetchPostsByTag(0);
  }
  Future<void> fetchPostsByTag(int index) async {
    state = state.copyWith(
      isLoading: true,
      selectedTagIndex: index,
      currentPage: 1,
    );
    try {
      final posts = await sortApi.sortPosts(sort: state.tagNames[index]);
      state = state.copyWith(posts: posts, isLoading: false);
    } catch (e) {
      // 에러 처리 (간단 로그 출력)
      state = state.copyWith(isLoading: false);
    }
  }
}

class SearchState {
  final bool isLoading;
  final bool isFetchingMore;
  final List<PostModel> posts;
  final int selectedTagIndex;
  final int currentPage;
  final List<String> tagNames;
  factory SearchState.initial() {
    return SearchState(
      isLoading: false,
      isFetchingMore: false,
      posts: [],
      selectedTagIndex: 0,
      currentPage: 1,
      tagNames: [
        "popular",
        "recent",
        "major",
        "academic",
        "art",
          "hobby",
        "volunteer",
        "language",
        "startup",
        "travel",
      ],
    );
  }

  SearchState({
    required this.isLoading,
    required this.isFetchingMore,
    required this.posts,
    required this.selectedTagIndex,
    required this.currentPage,
    required this.tagNames,
  });
  SearchState copyWith({
    bool? isLoading,
    bool? isFetchingMore,
    List<PostModel>? posts,
    int? selectedTagIndex,
    int? currentPage,
    List<String>? tagNames,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      posts: posts ?? this.posts,
      selectedTagIndex: selectedTagIndex ?? this.selectedTagIndex,
      currentPage: currentPage ?? this.currentPage,
      tagNames: tagNames ?? this.tagNames,
    );
  }
}

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>((ref) {
      return SearchViewModel(SortApi());
    });

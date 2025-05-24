// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod/riverpod.dart';

import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/search_api.dart';

class SearchBarViewModel extends StateNotifier<SearchBarState> {
  final SearchApi searchApi;
  SearchBarViewModel(this.searchApi) : super(SearchBarState.initial());
  void updateSearchText(String text) {
    state = state.copyWith(text: text);
    // 필요시 검색 API 호출 등 처리
  }

  void searchPosts(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(searchResults: []);
      return;
    }
    state = state.copyWith(isLoading: true);

    try {
      final results = await searchApi.searchPosts(query);
      state = state.copyWith(searchResults: results);
    } catch (e) {
      print('검색 오류: $e');
    }
    state = state.copyWith(isLoading: false);
  }
}

class SearchBarState {
  final List<PostModel> searchResults;
  final bool isLoading;
  final String text;

  factory SearchBarState.initial() {
    return SearchBarState(isLoading: false, searchResults: [], text: '');
  }

  SearchBarState({
    required this.searchResults,
    required this.isLoading,
    required this.text,
  });

  SearchBarState copyWith({
    List<PostModel>? searchResults,
    bool? isLoading,
    String? text,
  }) {
    return SearchBarState(
      searchResults: searchResults ?? this.searchResults,
      isLoading: isLoading ?? this.isLoading,
      text: text ?? this.text,
    );
  }
}

final searchBarViewModelProvider =
    StateNotifierProvider<SearchBarViewModel, SearchBarState>((ref) {
      return SearchBarViewModel(SearchApi());
    });

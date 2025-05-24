// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/widgets.dart';

import 'package:componentss/features/study/data/group_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchGroupViewModel extends StateNotifier<SearchGroupState> {
  GroupApi groupApi;
  SearchGroupViewModel(this.groupApi) : super(SearchGroupState.initial());

  Future<GroupModel?> searchGroup() async {
    final groupCode = state.digits.join();
    final group = await groupApi.getGroupByJoinCode(groupCode);
    return group;
  }

  Future<bool> joinGroup(String groupId, String userId) async {
    try {
      return await groupApi.joinGroup(groupId, userId);
    } catch (e) {
      return false;
      // API 호출 중 에러 발생 시 처리
    }
  }
}

class SearchGroupState {
  final bool isButtonEnabled;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<String> digits;

  SearchGroupState({
    required this.isButtonEnabled,
    required this.controller,
    required this.focusNode,
    required this.digits,
  }); // 숫자를 저장하는 리스트

  SearchGroupState copyWith({
    bool? isButtonEnabled,
    TextEditingController? controller,
    FocusNode? focusNode,
    List<String>? digits,
  }) {
    return SearchGroupState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      digits: digits ?? this.digits,
    );
  }

  factory SearchGroupState.initial() {
    return SearchGroupState(
      isButtonEnabled: false,
      controller: TextEditingController(),
      focusNode: FocusNode(),
      digits: List.filled(4, ""),
    );
  }
}

final SearchGroupViewModelProvider =
    StateNotifierProvider<SearchGroupViewModel, SearchGroupState>((ref) {
      return SearchGroupViewModel(GroupApi());
    });

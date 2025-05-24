// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';
import 'package:componentss/features/study/data/group_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:componentss/features/study/data/group_model.dart';

class GroupDetailViewModel extends StateNotifier<GroupDetailState> {
  final GroupApi groupApi;
  GroupDetailViewModel(this.groupApi) : super(GroupDetailState.initial());

  Future<void> loadGroupAndScores(String joinCode) async {
    final group = await groupApi.getGroupByJoinCode(joinCode);
    if (group != null) {
      final scores = await GroupApi().fetchMemberScores(group.memberIds);

      state.copyWith(group: group);
      state.copyWith(memberScores: scores);
    } else {
      print('❌ 그룹 정보를 가져오지 못했습니다.');
    }
  }

  Future<void> loadUserData(String userId) async {
    final userData = await groupApi.getUserById(userId);

    if (userData != null) {
      state.copyWith(username: userData['username']); // 사용자 이름 저장
      // 사용자 데이터를 상태로 저장하거나 UI에 반영
    } else {
      print('❌ 사용자 데이터를 가져오지 못했습니다.');
    }
  }
}

class GroupDetailState {
  final GroupModel? group;
  final int? score;
  final Map<String, int> memberScores;
  final String? username;

  factory GroupDetailState.initial() {
    return GroupDetailState(
      group: null,
      score: 0,
      memberScores: {},
      username: null,
    );
  }
  GroupDetailState({
    required this.group,
    required this.score,
    required this.memberScores,
    required this.username,
  });

  GroupDetailState copyWith({
    GroupModel? group,
    int? score,
    Map<String, int>? memberScores,
    String? username,
  }) {
    return GroupDetailState(
      group: group ?? this.group,
      score: score ?? this.score,
      memberScores: memberScores ?? this.memberScores,
      username: username ?? this.username,
    );
  }
}

final groupDetailViewModelProvider =
    StateNotifierProvider<GroupDetailViewModel, GroupDetailState>((ref) {
      return GroupDetailViewModel(GroupApi());
    });

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';

class StudyState {
  final List<GroupModel> studyGroups; // 스터디 그룹 목록
  final bool isLoading; // 데이터 로딩 상태
  final int score; // 점수 초기화
  final bool isExpanded;

  factory StudyState.initial() {
    return StudyState(
      studyGroups: [],
      isLoading: false,
      score: 0,
      isExpanded: false,
    );
  }

  StudyState({
    required this.studyGroups,
    required this.isLoading,
    required this.score,
    required this.isExpanded,
  });

  StudyState copyWith({
    List<GroupModel>? studyGroups,
    bool? isLoading,
    int? score,
    bool? isExpanded,
  }) {
    return StudyState(
      studyGroups: studyGroups ?? this.studyGroups,
      isLoading: isLoading ?? this.isLoading,
      score: score ?? this.score,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class StudyScreenViewModel extends StateNotifier<StudyState> {
  final GroupApi groupApi;
  StudyScreenViewModel(this.groupApi) : super(StudyState.initial());

  Future<void> fetchGroupsByUserId(String userId) async {
    try {
      final groups = await groupApi.getGroupsById(userId); // GroupApi 활용
      if (groups != null) {
        groups.sort((a, b) {
          int scoreA = a.score ?? 0; // null일 경우 0으로 처리 (예시)
          int scoreB = b.score ?? 0; // null일 경우 0으로 처리 (예시)
          return scoreB.compareTo(scoreA); // 내림차순 정렬 (b와 a의 위치를 바꾸면 오름차순)
        });

        state.copyWith(studyGroups: groups);
        state.copyWith(isLoading: false);
      } else {
        throw Exception('Failed to load groups for user $userId');
      }
    } catch (e) {
      print("Error fetching groups for user $userId: $e");
      state.copyWith(isLoading: false);
    }
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }
}

final StudyScreenViewModelProvider =
    StateNotifierProvider<StudyScreenViewModel, StudyState>((ref) {
      return StudyScreenViewModel(GroupApi());
    });

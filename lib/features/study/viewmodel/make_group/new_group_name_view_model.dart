// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:componentss/features/study/view/make_group/new_group_complete_screen.dart';

import '../../data/group_api.dart';
import 'package:componentss/core/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

class NewGroupNameViewModel extends StateNotifier<NewGroupNameState> {
  GroupApi groupApi;
  NewGroupNameViewModel(this.groupApi) : super(NewGroupNameState.initial());

  void _updateNextButtonState() {
    state.copyWith(
      isNextButtonEnabled:
          state.GroupName != null && state.GroupName!.isNotEmpty,
    );
  }

  void handleImageSelected(File? image) {
    state.copyWith(selectedImage: image);
    _updateNextButtonState();
  }

  void handleNameSelected(String? text) {
    state.copyWith(GroupName: text);
    _updateNextButtonState();
  }

  void handleNextButtonTap(WidgetRef ref, BuildContext context) async {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String category = args['category'];
    final user = ref.watch(userProvider);
    await groupApi.uploadGroup({
      'name': state.GroupName,
      'imagePath': state.selectedImage?.path,
      'authorId': user!.email,
      "tags": ["tag1", "tag2"],
    }, ref);

    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)
    if (state.isNextButtonEnabled) {
      state.copyWith(isNextButtonClicked: true);
      await groupApi.uploadGroup(args, ref); // 그룹 업로드 메서드 호출

      // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewGroupCompleteScreen(),
          settings: RouteSettings(
            arguments: {
              'category': category,
              'groupName': state.GroupName,
              'imagePath': state.selectedImage?.path,
            },
          ),
        ),
      ).then((_) {
        // StudyMakeGroup2 에서 돌아온 후에 이 코드가 실행됨
        // 위젯이 화면에 아직 마운트되어 있는지 확인 (중요)
        if (mounted) {
          // 3. 버튼 상태를 다시 false로 초기화
          state.copyWith(isNextButtonClicked: false);
        }
      });
    } else {
      print("다음 버튼 클릭 불가");
    }
  }
}

class NewGroupNameState {
  final File? selectedImage;
  final String? GroupName;
  final bool isNextButtonClicked;
  final bool isNextButtonEnabled;
  factory NewGroupNameState.initial() {
    return NewGroupNameState(
      selectedImage: null,
      GroupName: '',
      isNextButtonClicked: false,
      isNextButtonEnabled: false,
    );
  }

  NewGroupNameState({
    required this.selectedImage,
    required this.GroupName,
    required this.isNextButtonClicked,
    required this.isNextButtonEnabled,
  });

  NewGroupNameState copyWith({
    File? selectedImage,
    String? GroupName,
    bool? isNextButtonClicked,
    bool? isNextButtonEnabled,
  }) {
    return NewGroupNameState(
      selectedImage: selectedImage ?? this.selectedImage,
      GroupName: GroupName ?? this.GroupName,
      isNextButtonClicked: isNextButtonClicked ?? this.isNextButtonClicked,
      isNextButtonEnabled: isNextButtonEnabled ?? this.isNextButtonEnabled,
    );
  }
}

final NewGroupNameViewModelProvider =
    StateNotifierProvider<NewGroupNameViewModel, NewGroupNameState>((ref) {
      return NewGroupNameViewModel(GroupApi());
    });

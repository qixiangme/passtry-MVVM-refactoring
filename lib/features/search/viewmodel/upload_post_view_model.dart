// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:componentss/features/search/data/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:componentss/features/search/data/post_api.dart';

class UploadPostViewModel extends StateNotifier<UploadState> {
  UploadPostViewModel()
    : super(
        UploadState(
          titleTextController: TextEditingController(),
          textController: TextEditingController(),
          tagSelection: List.generate(8, (_) => false),
          selectedImage: null,
        ),
      );

  Map<int, Map<String, String>> categoryDict = {
    0: {'icon': '💻', 'text': '전공'},
    1: {'icon': '📚', 'text': '학술'},
    2: {'icon': '🎨', 'text': '예술'},
    3: {'icon': '👥', 'text': '취미'},
    4: {'icon': '☀️', 'text': '봉사'},
    5: {'icon': '🔠', 'text': '어학'},
    6: {'icon': '🤝', 'text': '창업'},
    7: {'icon': '✈️', 'text': '여행'},
  };

  void toggleTag(int index) {
    final newSelection = [...state.tagSelection];
    newSelection[index] = !newSelection[index];
    state = state.copyWith(tagSelection: newSelection);
  }

  void setImage(File image) {
    state = state.copyWith(selectedImage: image);
  }

  Future<bool> uploadPost(String email) async {
    final selectedTag = <String>[];
    for (int i = 0; i < state.tagSelection.length; i++) {
      if (state.tagSelection[i]) {
        selectedTag.add(categoryDict[i]!['text']!);
      }
    }
    final post = PostModel(
      email,
      DateTime.now().toString(),
      0,
      selectedTag,
      title: state.titleTextController.text,
      content: state.textController.text,
      id: email,
    );
    return await PostApi().uploadPostWithFile(post);
  }
}

class UploadState {
  final List<bool> tagSelection;
  final File? selectedImage;
  final TextEditingController titleTextController;
  final TextEditingController textController;

  UploadState({
    required this.tagSelection,
    required this.titleTextController,
    required this.textController,
    required this.selectedImage,
  });

  UploadState copyWith({
    List<bool>? tagSelection,
    File? selectedImage,
    TextEditingController? titleTextController,
    TextEditingController? textController,
  }) {
    return UploadState(
      tagSelection: tagSelection ?? this.tagSelection,
      selectedImage: selectedImage ?? this.selectedImage,
      titleTextController: titleTextController ?? this.titleTextController,
      textController: textController ?? this.textController,
    );
  }
}

final uploadPostViewModelProvider =
    StateNotifierProvider<UploadPostViewModel, UploadState>(
      (ref) => UploadPostViewModel(),
    );

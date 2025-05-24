// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class StudyMakeViewModel extends StateNotifier<StudyMakeState> {
  StudyMakeViewModel() : super(StudyMakeState());
  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void selectTime(TimeOfDay time) {
    state = state.copyWith(selectedTime: time);
  }

  void handleNextButtonTap() {
    state.copyWith(isNextButtonEnabled: !state.isNextButtonEnabled);
  }

  void updateNextButtonState() {
    final isEnabled =
        state.selectedCategoryItemText != null &&
        state.selectedCategoryChipText != null;
    state = state.copyWith(isNextEnabled: isEnabled);
  }

  void handleCategoryItemSelect(String itemText) {
    state = state.copyWith(selectedCategoryItemText: itemText);
    updateNextButtonState();
  }

  void handleCategoryChipSelect(String chipText) {
    state = state.copyWith(selectedCategoryChipText: chipText);
    updateNextButtonState();
  }

  void selectCategory(String text) {
    state = state.copyWith(category: text);
  }

  void selectChip(String text) {
    state = state.copyWith(category2: text);
  }

  void handleStudyLevelSelect(String itemText) {
    final nextText = itemText.isNotEmpty ? '퀘스트 생성하기' : '다음';
    state = state.copyWith(
      selectedStudyLevelText: itemText,
      isNextEnabled: itemText.isNotEmpty,
      nextButtonText: nextText,
    );
  }

  void handleInclusionOptionSelect(String itemText) {
    state = state.copyWith(selectedInclusionOptionText: itemText);
  }

  void setDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void setTime(TimeOfDay time) {
    state = state.copyWith(selectedTime: time);
  }

  int calculateRemainingDays() {
    if (state.selectedDate == null) return 0;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final interviewDate = DateTime(
      state.selectedDate!.year,
      state.selectedDate!.month,
      state.selectedDate!.day,
    );
    final difference = interviewDate.difference(today).inDays;
    return difference >= 0 ? difference : 0;
  }

  String mapDifficultyToEnum(String? difficulty) {
    switch (difficulty) {
      case '난이도 상':
        return 'HIGH';
      case '난이도 중':
        return 'MID';
      case '난이도 하':
        return 'LOW';
      case '난이도 기초':
        return 'BASIC';
      default:
        return 'BASIC';
    }
  }

  String mapCategoryToEnum(String category) {
    switch (category) {
      case '교내동아리':
        return 'SCHOOLCLUB';
      case '연합동아리':
        return 'JOINTCLUB';
      case '서포터즈':
        return 'SUPPORTERS';
      case '봉사단':
        return 'VOLUNTEERGROUP';
      case '인턴 • 현장실습':
        return 'INTERNSHIP';
      case '기타':
        return 'OTHERS';
      default:
        return 'OTHERS';
    }
  }

  void handleNameSelected(String text) {
    state.copyWith(nextButtonText: text);
  }
}

class StudyMakeState {
  final bool isNextButtonClicked;
  final String? category;
  final String? category2;
  final DateTime? selectedDate;
  final isNextButtonEnabled;
  final TimeOfDay? selectedTime;
  final bool isNextEnabled;
  final String? selectedStudyLevelText;
  final String? selectedInclusionOptionText;
  final String nextButtonText;
  final String? selectedCategoryItemText;
  final String? selectedCategoryChipText;

  StudyMakeState({
    this.isNextButtonClicked = false,
    this.category,
    this.isNextButtonEnabled = false,
    this.category2,
    this.selectedDate,
    this.selectedTime,
    this.isNextEnabled = false,
    this.selectedStudyLevelText,
    this.selectedInclusionOptionText,
    this.nextButtonText = '다음',
    this.selectedCategoryItemText,
    this.selectedCategoryChipText,
  });

  StudyMakeState copyWith({
    bool? isNextButtonClicked,
    String? category,
    String? category2,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? isNextEnabled,
    bool? isNextButtonEnabled,
    String? selectedStudyLevelText,
    String? selectedInclusionOptionText,
    String? nextButtonText,
    String? selectedCategoryItemText,
    String? selectedCategoryChipText,
  }) {
    return StudyMakeState(
      isNextButtonClicked: isNextButtonClicked ?? this.isNextButtonClicked,
      category: category ?? this.category,
      category2: category2 ?? this.category2,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      isNextEnabled: isNextEnabled ?? this.isNextEnabled,
      isNextButtonEnabled: isNextButtonEnabled ?? this.isNextButtonEnabled,
      selectedStudyLevelText:
          selectedStudyLevelText ?? this.selectedStudyLevelText,
      selectedInclusionOptionText:
          selectedInclusionOptionText ?? this.selectedInclusionOptionText,
      nextButtonText: nextButtonText ?? this.nextButtonText,
      selectedCategoryItemText:
          selectedCategoryItemText ?? this.selectedCategoryItemText,
      selectedCategoryChipText:
          selectedCategoryChipText ?? this.selectedCategoryChipText,
    );
  }
}

final StudyMakeViewModelProvider =
    StateNotifierProvider<StudyMakeViewModel, StudyMakeState>((ref) {
      return StudyMakeViewModel();
    });

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewGroupCategoryViewModel extends StateNotifier<NewGroupCategorystate> {
  NewGroupCategoryViewModel() : super(NewGroupCategorystate());

  void selectedCategory(String category) {
    state = state.copyWith(
      selectedCategoryItemText: category,
      isNextButtonEnabled: false,
    );
  }
}

final NewGroupCategoryViewModelProvider =
    StateNotifierProvider<NewGroupCategoryViewModel, NewGroupCategorystate>((
      ref,
    ) {
      return NewGroupCategoryViewModel();
    });

class NewGroupCategorystate {
  final String? selectedCategoryItemText;
  final bool isNextButtonEnabled;

  NewGroupCategorystate({
    this.selectedCategoryItemText,
    this.isNextButtonEnabled = false,
  });
  // factory NewGroupCategorystate.initialize() {
  //   return NewGroupCategorystate(
  //     selectedCategoryItemText: selectedCategoryItemText,
  //     isNextButtonEnabled: false,
  //   );
  // }

  NewGroupCategorystate copyWith({
    String? selectedCategoryItemText,
    bool? isNextButtonEnabled,
  }) {
    return NewGroupCategorystate(
      selectedCategoryItemText:
          selectedCategoryItemText ?? this.selectedCategoryItemText,
      isNextButtonEnabled: isNextButtonEnabled ?? this.isNextButtonEnabled,
    );
  }
}

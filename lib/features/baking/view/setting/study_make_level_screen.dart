import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/data/interview/interview_api.dart';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:componentss/features/baking/ui/setting/study_make_group_name_screen.dart';
import 'package:componentss/features/baking/viewmodel/baking_setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyMakeLevel extends ConsumerStatefulWidget {
  const StudyMakeLevel({super.key});

  @override
  ConsumerState<StudyMakeLevel> createState() => _StudyMakeLevelState();
}

class _StudyMakeLevelState extends ConsumerState<StudyMakeLevel> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(StudyMakeViewModelProvider);
    final vm = ref.watch(StudyMakeViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(CustomIcon.back, size: 18),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              '퀘스트 난이도를 선택해주세요',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '준비 기간이 짧다면 난이도 중 이상을 추천해요',
              style: TextStyle(
                color: const Color(0xFF8E95A2),
                fontSize: 44.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.44,
              ),
            ),
            SizedBox(height: 150.h),
            SizedBox(height: 50.h),
            StudyLevels(onItemSelected: vm.handleStudyLevelSelect),
            SizedBox(height: 150.h),

            SizedBox(height: 50.h),
            InclusionOptions(onItemSelected: vm.handleInclusionOptionSelect),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 200.h),
              child: Center(
                child: NextButton(
                  isEnabled: state.isNextButtonEnabled,
                  onTap: vm.handleNextButtonTap,
                  text: state.nextButtonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyLevel extends StatefulWidget {
  final String text;
  final String assetPath;
  final bool isSelected;
  final Function(String) onSelected;

  const StudyLevel({
    super.key,
    required this.text,
    required this.assetPath,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _StudyLevelState createState() => _StudyLevelState();
}

class _StudyLevelState extends State<StudyLevel> {
  @override
  Widget build(BuildContext context) {
    Color containerColor =
        widget.isSelected ? Colors.orange.withOpacity(0.3) : Colors.white;
    Color borderColor =
        widget.isSelected ? Colors.orange : const Color(0xFFEBEBEB);

    return GestureDetector(
      onTap: () {
        print("${widget.text} 클릭됨");
        widget.onSelected(widget.text);
      },
      child: Container(
        width: 450.w,
        padding: EdgeInsets.only(
          top: 46.h,
          left: 50.w,
          right: 50.w,
          bottom: 46.h,
        ),
        decoration: ShapeDecoration(
          color: containerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(38.50.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.assetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 50.w),
            Text(
              widget.text,
              style: TextStyle(
                color: const Color(0xFF434343),
                fontSize: 30.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyLevels extends StatefulWidget {
  final Function(String) onItemSelected;

  const StudyLevels({required this.onItemSelected, super.key});

  @override
  _StudyLevelsState createState() => _StudyLevelsState();
}

class LevelInfo {
  final String text;
  final String assetPath;

  LevelInfo({required this.text, required this.assetPath});
}

class _StudyLevelsState extends State<StudyLevels> {
  String? selectedText;

  final List<LevelInfo> items = [
    LevelInfo(text: '난이도 상', assetPath: 'assets/icons/croissant.png'),
    LevelInfo(text: '난이도 중', assetPath: 'assets/icons/baguette.png'),
    LevelInfo(text: '난이도 하', assetPath: 'assets/icons/white_bread.png'),
    LevelInfo(text: '난이도 기초', assetPath: 'assets/icons/kneading.png'),
  ];

  void handleLevelSelected(String text) {
    setState(() {
      selectedText = text;
    });
    widget.onItemSelected(text);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15.w,
      runSpacing: 15.h,
      children:
          items.map((itemInfo) {
            return StudyLevel(
              text: itemInfo.text,
              assetPath: itemInfo.assetPath,
              isSelected: selectedText == itemInfo.text,
              onSelected: handleLevelSelected,
            );
          }).toList(),
    );
  }
}

class InclusionOption extends StatefulWidget {
  final String text;
  final String assetPath;
  final bool isSelected;
  final Function(String) onSelected;

  const InclusionOption({
    super.key,
    required this.text,
    required this.assetPath,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _InclusionOptionState createState() => _InclusionOptionState();
}

class _InclusionOptionState extends State<InclusionOption> {
  @override
  Widget build(BuildContext context) {
    Color containerColor =
        widget.isSelected ? Colors.orange.withOpacity(0.3) : Colors.white;
    Color borderColor =
        widget.isSelected ? Colors.orange : const Color(0xFFEBEBEB);

    return GestureDetector(
      onTap: () {
        print("${widget.text} 클릭됨");
        widget.onSelected(widget.text);
      },
      child: Container(
        width: 450.w,
        padding: EdgeInsets.only(
          top: 46.h,
          left: 40.w,
          right: 40.w,
          bottom: 46.h,
        ),
        decoration: ShapeDecoration(
          color: containerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(38.50.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.assetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 30.w),
            Text(
              widget.text,

              style: TextStyle(
                color: const Color(0xFF434343),
                fontSize: 30.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InclusionOptions extends StatefulWidget {
  final Function(String) onItemSelected;

  const InclusionOptions({required this.onItemSelected, super.key});

  @override
  _InclusionOptionsState createState() => _InclusionOptionsState();
}

class InclusionOptionInfo {
  final String text;
  final String assetPath;

  InclusionOptionInfo({required this.text, required this.assetPath});
}

class _InclusionOptionsState extends State<InclusionOptions> {
  String? selectedText;

  // final List<InclusionOptionInfo> items = [
  //   InclusionOptionInfo(text: '포함합니다', assetPath: 'assets/images/box.png'),
  //   InclusionOptionInfo(text: '포함하지 않습니다', assetPath: 'assets/images/box.png'),
  // ];

  void handleInclusionOptionSelected(String text) {
    setState(() {
      selectedText = text;
    });
    widget.onItemSelected(text);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15.w,
      runSpacing: 15.h,
      // children:
      //     items.map((InclusionOptionInfo) {
      //       return InclusionOption(
      //         text: InclusionOptionInfo.text,
      //         assetPath: InclusionOptionInfo.assetPath,
      //         isSelected: selectedText == InclusionOptionInfo.text,
      //         onSelected: handleInclusionOptionSelected,
      //       );
      //     }).toList(),
    );
  }
}

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;
  final String text;

  const NextButton({
    required this.isEnabled,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = isEnabled ? Color(0xFFFF9F1C) : Colors.white;
    Color borderColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);
    Color textColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 993.w,
        height: 160.h,
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 50.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.50,
          ),
        ),
      ),
    );
  }
}

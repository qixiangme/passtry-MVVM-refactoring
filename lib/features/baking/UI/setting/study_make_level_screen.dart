import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/UI/setting/study_comeplete_screen.dart';
import 'package:componentss/features/baking/data/interview/interview_api.dart';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:componentss/features/baking/ui/setting/study_make_group_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class StudyMakeLevel extends StatefulWidget {
  const StudyMakeLevel({super.key});

  @override
  State<StudyMakeLevel> createState() => _StudyMakeLevelState();
}

class _StudyMakeLevelState extends State<StudyMakeLevel> {
  final bool _isNextButtonClicked = false; // 버튼 상태를 부모에서 관리

  String? _selectedStudyLevelText;
  String? _selectedInclusionOptionText;

  bool _isNextButtonEnabled = false;
  String _nextButtonText = '다음';
  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled = _selectedStudyLevelText != null;
      _nextButtonText = _selectedStudyLevelText != null ? '퀘스트 생성하기' : '다음';
    });
  }

  void _handleStudyLevelSelect(String itemText) {
    setState(() {
      _selectedStudyLevelText = itemText;
      _updateNextButtonState();
    });
    // 디버깅용 출력
  }

  void _handleInclusionOptionSelect(String itemText) {
    setState(() {
      _selectedInclusionOptionText = itemText;
      _updateNextButtonState();
    });
    // 디버깅용 출력
  }

  void _handleNextButtonTap() async {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    final String category = args['category'];
    final String category2 = args['category2'];
    final DateTime selectedDate = DateTime.parse(args['date']); // DateTime으로 변환
    final String time = args['time'];

    final String? studyLevel = _selectedStudyLevelText; // 난이도
    final String? inclusionOption = _selectedInclusionOptionText; // 포함 여부

    // ENUM 변환
    final String questDifficulty = _mapDifficultyToEnum(studyLevel);
    final String mappedCategory = _mapCategoryToEnum(category);
    final String mappedCategory2 = _mapCategoryToEnum(category2);
    final bool includeTrendQuiz = inclusionOption == '포함합니다';

    // InterviewModel 생성
    final interview = InterviewModel(
      userId: user!.id!, // UserProvider에서 가져온 사용자 ID
      name: '인터뷰 이름', // 필요에 따라 설정
      category: _mapCategoryToEnum(category),
      tags: [mappedCategory2],
      date: DateFormat('yyyy-MM-dd').format(selectedDate), // YYYY-MM-DD 형식으로 변환
      time: time,
      questDifficulty: questDifficulty,
      includeTrendQuiz: includeTrendQuiz,
    );
    print("DEVUG");
    // POST 요청
    final success = await InterviewApi.postInterview(interview);
    if (success) {
      print("인터뷰 생성 성공");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudyMakeGroupName()),
      );
    }
  }

  // 난이도를 ENUM 형식으로 변환
  String _mapDifficultyToEnum(String? difficulty) {
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

  String _mapCategoryToEnum(String category) {
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

  @override
  Widget build(BuildContext context) {
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
            StudyLevels(onItemSelected: _handleStudyLevelSelect),
            SizedBox(height: 150.h),

            SizedBox(height: 50.h),
            InclusionOptions(onItemSelected: _handleInclusionOptionSelect),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 200.h),
              child: Center(
                child: NextButton(
                  isEnabled: _isNextButtonEnabled,
                  onTap: _handleNextButtonTap,
                  text: _nextButtonText,
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

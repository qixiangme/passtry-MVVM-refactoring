import 'package:componentss/features/study/ui/make_group/study_make_group_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupLevel extends StatefulWidget {
  const StudyMakeGroupLevel({super.key});

  @override
  State<StudyMakeGroupLevel> createState() => _StudyMakeGroupLevelState();
}

class _StudyMakeGroupLevelState extends State<StudyMakeGroupLevel> {
  bool _isNextButtonClicked = false; // 버튼 상태를 부모에서 관리

  String? _selectedStudyLevelText;
  String? _selectedInclusionOptionText;

  bool _isNextButtonEnabled = false;
  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled =
          _selectedStudyLevelText != null && _selectedInclusionOptionText != null;
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


  void _handleNextButtonTap() {

    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String category = args['category'];
    final String category2 = args['category2'];
    final String date = args['date'];
    final String time = args['time'];
    print('category: $category');
    print('category2: $category2');
    print('Selected Date: $date');
    print('Selected Time: $time');

    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)
    if (_isNextButtonEnabled) {
      print("--- 다음 버튼 클릭 ---");
      print("선택된 난이도: ${_selectedStudyLevelText ?? '선택되지 않음'}");
      print("포함할까요?: ${_selectedInclusionOptionText ?? '선택되지 않음'}");
      print("--------------------");
      setState(() {
        _isNextButtonClicked = true;
      });

      // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudyMakeGroupName(),
        settings: RouteSettings(
        arguments: {
        'category': category,
        'category2': category2,
        'date': date,
        'time': time,
        'studyLevel': _selectedStudyLevelText,
        'inclusionOption': _selectedInclusionOptionText,
        },
      ),
      ),
    ).then((_) {
      // StudyMakeGroup2 에서 돌아온 후에 이 코드가 실행됨
      // 위젯이 화면에 아직 마운트되어 있는지 확인 (중요)
      if (mounted) {
        // 3. 버튼 상태를 다시 false로 초기화
        setState(() {
          _isNextButtonClicked = false;
        });
      }
    });

    }
    else {
      print("다음 버튼 클릭 불가");
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
            Container(
              width: 70.w,
              height: 70.h,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            StudyLevels(onItemSelected: _handleStudyLevelSelect),
            SizedBox(height: 150.h),
            Row(
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 40.w),

                Text('최근 이슈, 트랜드 퀴즈도 포함할까요?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),)
              ],
            ),
            SizedBox(height: 50.h),
            InclusionOptions(onItemSelected: _handleInclusionOptionSelect),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(bottom: 200.h),
                child : Center(
                  child: NextButton(
                    isEnabled: _isNextButtonEnabled,
                    onTap: _handleNextButtonTap,
                  ),)
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

  StudyLevel({
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

  const StudyLevels({required this.onItemSelected, Key? key}) : super(key: key);

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
    LevelInfo(text: '난이도 상', assetPath: 'assets/images/box.png'),
    LevelInfo(text: '난이도 중', assetPath: 'assets/images/box.png'),
    LevelInfo(text: '난이도 하', assetPath: 'assets/images/box.png'),
    LevelInfo(text: '난이도 기초', assetPath: 'assets/images/box.png'),
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

  InclusionOption({
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

  const InclusionOptions({required this.onItemSelected, Key? key}) : super(key: key);

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

  final List<InclusionOptionInfo> items = [
    InclusionOptionInfo(text: '포함합니다', assetPath: 'assets/images/box.png'),
    InclusionOptionInfo(text: '포함하지 않습니다', assetPath: 'assets/images/box.png'),

  ];

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
      children:
      items.map((InclusionOptionInfo) {
        return InclusionOption(
          text: InclusionOptionInfo.text,
          assetPath: InclusionOptionInfo.assetPath,
          isSelected: selectedText == InclusionOptionInfo.text,
          onSelected: handleInclusionOptionSelected,
        );
      }).toList(),
    );
  }
}

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const NextButton({required this.isEnabled, required this.onTap, Key? key})
      : super(key: key);

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
          '다음',
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/study/study_make_group_screen2.dart';

class StudyMakeGroup extends StatefulWidget {
  const StudyMakeGroup({super.key});

  @override
  State<StudyMakeGroup> createState() => _StudyMakeGroupState();
}

class _StudyMakeGroupState extends State<StudyMakeGroup> {
  bool _isNextButtonClicked = false; // 버튼 상태를 부모에서 관리

  // 다음 버튼 탭 처리 및 네비게이션 함수
  void _handleNextButtonTap() {
    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)
    setState(() {
      _isNextButtonClicked = true;
    });

    print("다음으로");

    // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudyMakeGroup2()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150.h),

                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // 이전 페이지로 이동
                  },
                ),
                SizedBox(height: 100.h),
                Text(
                  '어떤 면접을 앞두고 계신가요?',
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
                    fontSize: 70.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '준비하고 있는 단체와 분야를 알려주세요',
                  style: TextStyle(
                    color: const Color(0xFF8E95A2),
                    fontSize: 44.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.44,
                  ),
                ),
                SizedBox(height: 120.h),
                Container(
                  width: 992.w,
                  padding: (EdgeInsets.symmetric(horizontal: 50.w)),
                  child: buildCategoryItems(),
                ),

                SizedBox(height: 100.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 77.w),
                  width: 991.w,
                  child: buildCategoryChipGroup(),
                ),

                SizedBox(height: 150.h),
                Center(
                  child: NextButton(
                    isClicked: _isNextButtonClicked, // 부모의 상태 전달
                    onTap: _handleNextButtonTap, // 부모의 함수 전달
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String text;
  final String assetPath;
  final bool isSelected;
  final Function(String) onSelected;

  const CategoryItem({
    super.key,
    required this.text,
    required this.assetPath,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
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
        width: 250.w,
        height: 250.h,
        padding: EdgeInsets.all(20.w),
        decoration: ShapeDecoration(
          color: containerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(38.50.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.assetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              widget.text,
              style: TextStyle(
                color: const Color(0xFF434343),
                fontSize: 30.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class CategoryInfo {
  final String text;
  final String assetPath;

  CategoryInfo({required this.text, required this.assetPath});
}

class _CategoryItemsState extends State<CategoryItems> {
  String? selectedText;

  final List<CategoryInfo> items = [
    CategoryInfo(text: '교내동아리', assetPath: 'assets/images/box.png'),
    CategoryInfo(text: '연합동아리', assetPath: 'assets/images/box.png'),
    CategoryInfo(text: '서포터즈', assetPath: 'assets/images/box.png'),
    CategoryInfo(text: '봉사단', assetPath: 'assets/images/box.png'),
    CategoryInfo(text: '인턴 • 현장실습', assetPath: 'assets/images/box.png'),
    CategoryInfo(text: '기타', assetPath: 'assets/images/box.png'),
  ];

  void handleItemSelected(String text) {
    setState(() {
      selectedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 15.w,
      runSpacing: 15.h,
      children:
          items.map((itemInfo) {
            return CategoryItem(
              text: itemInfo.text,
              assetPath: itemInfo.assetPath,
              isSelected: selectedText == itemInfo.text,
              onSelected: handleItemSelected,
            );
          }).toList(),
    );
  }
}

Widget buildCategoryItems() {
  return CategoryItems();
}

class CategoryChip extends StatelessWidget {
  final String emoji;
  final String text;
  final bool isSelected;
  final Function(String) onSelected;

  const CategoryChip({
    required this.emoji,
    required this.text,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = isSelected ? const Color(0x21FF9F1C) : Colors.white;
    Color borderColor =
        isSelected ? const Color(0xFFFF9F1C) : const Color(0xFFEBEBEB);

    return GestureDetector(
      onTap: () {
        print("$text 클릭됨");
        onSelected(text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 26.h),
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(36.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: TextStyle(
                color: const Color(0xFF1C1C1C),
                fontSize: 36.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.36,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF1C1C1C),
                fontSize: 40.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChipInfo {
  final String emoji;
  final String text;

  CategoryChipInfo({required this.emoji, required this.text});
}

class CategoryChipGroup extends StatefulWidget {
  const CategoryChipGroup({super.key});

  @override
  _CategoryChipGroupState createState() => _CategoryChipGroupState();
}

class _CategoryChipGroupState extends State<CategoryChipGroup> {
  String? selectedChipText;

  // 표시할 칩 데이터 목록
  final List<CategoryChipInfo> chipItems = [
    CategoryChipInfo(emoji: '📚', text: '학술'),
    CategoryChipInfo(emoji: '💻', text: '전공'),
    CategoryChipInfo(emoji: '🎨', text: '예술'),
    CategoryChipInfo(emoji: '👥', text: '문화•취미'),
    CategoryChipInfo(emoji: '☀️', text: '봉사'),
    CategoryChipInfo(emoji: '🔠', text: '어학'),
    CategoryChipInfo(emoji: '🤝', text: '창업'),
    CategoryChipInfo(emoji: '✈️', text: '여행'),
  ];

  void handleChipSelected(String text) {
    setState(() {
      selectedChipText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      spacing: 20.w,
      runSpacing: 20.h,
      children:
          chipItems.map((chipInfo) {
            return CategoryChip(
              emoji: chipInfo.emoji,
              text: chipInfo.text,
              // 현재 선택된 텍스트와 이 칩의 텍스트가 같은지 비교하여 isSelected 결정
              isSelected: selectedChipText == chipInfo.text,
              // 콜백 함수 전달
              onSelected: handleChipSelected,
            );
          }).toList(), // map 결과를 List로 변환
    );
  }
}

Widget buildCategoryChipGroup() {
  return CategoryChipGroup();
}

class NextButton extends StatelessWidget {
  final bool isClicked; // 부모로부터 받을 클릭 상태
  final VoidCallback onTap; // 부모로부터 받을 탭 콜백 함수

  const NextButton({
    required this.isClicked, // 생성자에 추가
    required this.onTap, // 생성자에 추가
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // isClicked 상태는 이제 생성자로 받은 isClicked 사용
    Color bgColor = isClicked ? Color(0xFFFF9F1C) : Colors.white;
    Color borderColor = isClicked ? Colors.white : Color(0xFFFF9F1C);
    Color textColor = isClicked ? Colors.white : Color(0xFFFF9F1C);

    return InkWell(
      onTap: onTap, // 부모로부터 받은 onTap 콜백 사용
      child: AnimatedContainer(
        // 색상 변경 애니메이션 유지
        duration: const Duration(milliseconds: 200),
        width: 993.w,
        height: 160.h,
        // padding 제거됨 (필요시 추가)
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
        alignment: Alignment.center, // Row 대신 Alignment 사용 간소화
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

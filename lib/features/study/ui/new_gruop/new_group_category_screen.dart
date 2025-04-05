import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/study/ui/new_gruop/new_group_name_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class NewGroupCategoryScreen extends StatefulWidget {
  const NewGroupCategoryScreen({super.key});

  @override
  State<NewGroupCategoryScreen> createState() => _NewGroupCategoryScreenState();
}

class _NewGroupCategoryScreenState extends State<NewGroupCategoryScreen> {
  bool _isNextButtonClicked = false; // 버튼 상태를 부모에서 관리

  String? _selectedCategoryItemText;
  bool _isNextButtonEnabled = false;

  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled =
          _selectedCategoryItemText != null;
    });
  }

  void _handleCategoryItemSelect(String itemText) {
    setState(() {
      _selectedCategoryItemText = itemText;
      _updateNextButtonState(); // 버튼 상태 업데이트
    });
  }


  // 다음 버튼 탭 처리 및 네비게이션 함수
  void _handleNextButtonTap() {
    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)

    if (_isNextButtonEnabled) {
      print("--- 다음 버튼 클릭 ---");
      print("선택된 단체: ${_selectedCategoryItemText ?? '선택되지 않음'}");
      print("--------------------");
      setState(() {
        _isNextButtonClicked = true;
      });

      // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewGroupNameScreen(),
          settings: RouteSettings(
            arguments: {
              'category': _selectedCategoryItemText,
            }, // 전달할 데이터
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
    } else {
      print("다음 버튼 클릭 불가");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Text(
                  '어떤 면접을 준비하고 있는\n사람들과 함께하고 싶으신가요?',
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
                    fontSize: 60.sp,
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
                  padding: (EdgeInsets.symmetric(horizontal: 10.w)),
                  child: CategoryItems(
                    onItemSelected: _handleCategoryItemSelect,
                  ),
                ),

                SizedBox(height: 100.h),

                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 200.h),
                  child: Center(
                    child: NextButton(
                      isEnabled: _isNextButtonEnabled,
                      onTap: _handleNextButtonTap,
                    ),
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

  CategoryItem({
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
        width: 280.w,
        height: 280.h,
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
                  fit: BoxFit.contain,
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
  final Function(String) onItemSelected;

  const CategoryItems({required this.onItemSelected, Key? key})
      : super(key: key);

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
    CategoryInfo(text: '학술', assetPath: 'assets/icons/book.png'),
    CategoryInfo(text: '전공', assetPath: 'assets/icons/keyboard.png'),
    CategoryInfo(text: '예술', assetPath: 'assets/icons/art.png'),
    CategoryInfo(text: '취미', assetPath: 'assets/icons/guitar.png'),
    CategoryInfo(text: '봉사', assetPath: 'assets/icons/volunteer.png'),
    CategoryInfo(text: '어학', assetPath: 'assets/icons/chat.png'),
    CategoryInfo(text: '창업', assetPath: 'assets/icons/startup.png'),
    CategoryInfo(text: '여행', assetPath: 'assets/icons/travel.png'),
    CategoryInfo(text: '기타', assetPath: 'assets/icons/etc.png'),
  ];

  void handleItemSelected(String text) {
    setState(() {
      selectedText = text;
    });
    widget.onItemSelected(text);
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

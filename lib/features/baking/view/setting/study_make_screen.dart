import 'package:componentss/features/baking/viewmodel/baking_screen_view_model.dart';
import 'package:componentss/features/baking/viewmodel/baking_setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMake extends ConsumerStatefulWidget {
  const StudyMake({super.key});

  @override
  ConsumerState<StudyMake> createState() => _StudyMakeState();
}

class _StudyMakeState extends ConsumerState<StudyMake> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(StudyMakeViewModelProvider.notifier);
    final state = ref.watch(StudyMakeViewModelProvider);
    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: CategoryItems(
                    onItemSelected: vm.handleCategoryItemSelect,
                  ),
                ),

                SizedBox(height: 100.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 77.w),
                  width: 991.w,
                  child: CategoryChipGroup(
                    onChipSelected: vm.handleCategoryChipSelect,
                  ),
                ),

                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 200.h),
                  child: Center(
                    child: NextButton(
                      isEnabled: state.isNextButtonEnabled,
                      onTap: vm.handleNextButtonTap,
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
  final Function(String) onItemSelected;

  const CategoryItems({required this.onItemSelected, super.key});

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
    CategoryInfo(text: '교내동아리', assetPath: 'assets/icons/university.png'),
    CategoryInfo(text: '연합동아리', assetPath: 'assets/icons/union_club.png'),
    CategoryInfo(text: '서포터즈', assetPath: 'assets/icons/loud_speaker.png'),
    CategoryInfo(text: '봉사단', assetPath: 'assets/icons/volunteer.png'),
    CategoryInfo(
      text: '인턴 • 현장실습',
      assetPath: 'assets/icons/field_training.png',
    ),
    CategoryInfo(text: '기타', assetPath: 'assets/icons/baked_bread.png'),
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
  final Function(String) onChipSelected;

  const CategoryChipGroup({required this.onChipSelected, super.key});

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
    widget.onChipSelected(text);
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

              onSelected: handleChipSelected,
            );
          }).toList(),
    );
  }
}

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const NextButton({required this.isEnabled, required this.onTap, super.key});

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

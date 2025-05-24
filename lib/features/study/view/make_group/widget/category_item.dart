import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryInfo {
  final String text;
  final String assetPath;

  CategoryInfo({required this.text, required this.assetPath});
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

  const CategoryItems({required this.onItemSelected, super.key});

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
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
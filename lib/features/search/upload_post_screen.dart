import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.add)]),
      body: Column(
        children: [
          SizedBox(height: 20.h), // 화면 밀도 적용
          Center(
            child: Container(
              width: 992.w, // 화면 밀도 적용
              height: 119.h, // 화면 밀도 적용
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(38.5.r),
                ), // 화면 밀도 적용
              ),
            ),
          ),
          SizedBox(height: 10.h), // 화면 밀도 적용
          Center(
            child: Container(
              width: 992.w, // 화면 밀도 적용
              height: 683.h, // 화면 밀도 적용
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(38.5.r),
                ), // 화면 밀도 적용
              ),
            ),
          ),
          SizedBox(height: 20.h), // 화면 밀도 적용
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 39.w), // 화면 밀도 적용
              Text(
                "태그",
                style: TextStyle(
                  fontSize: 44.sp, // 화면 밀도 적용
                  color: Color(0XFF6B6B6B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 935.w, // 화면 밀도 적용
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              spacing: 18.r, // 화면 밀도 적용
              runSpacing: 18.r, // 화면 밀도 적용
              children: [
                // 태그 버튼들에 대한 부분도 동일하게 화면 밀도 적용
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 36.w, // 화면 밀도 적용
                    vertical: 26.h, // 화면 밀도 적용
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0x21FF9F1C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w, // 화면 밀도 적용
                        color: Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '📚',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                      Text(
                        '학술',
                        style: TextStyle(
                          color: Color(0xFF1C1C1C),
                          fontSize: 36.sp, // 화면 밀도 적용
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
                // 다른 Container들도 동일하게 화면 밀도 적용
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 39.w),
              Text(
                "사진",
                style: TextStyle(
                  fontSize: 44.sp, // 화면 밀도 적용
                  color: Color(0XFF6B6B6B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "*최대 2장까지 가능합니다.",
                style: TextStyle(
                  fontSize: 40.sp, // 화면 밀도 적용
                  color: Color(0XFFC4CAD4),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              SizedBox(
                width: 242.w,
                height: 242.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 242.w,
                        height: 242.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC4CAD4) /* gray */,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95.r,
                      top: 95.r,
                      child: Container(
                        width: 53.w,
                        height: 53.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Center(child: Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 242.w,
                height: 242.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 242.w,
                        height: 242.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC4CAD4) /* gray */,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95.r,
                      top: 95.r,
                      child: Container(
                        width: 53.w,
                        height: 53.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Center(child: Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

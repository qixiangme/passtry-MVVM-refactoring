import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({super.key});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Color(0xFF434343),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '면접까지',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  '-',
                  style: TextStyle(
                    color: Color(0XFFFF9F1C),
                    fontSize: 88.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            Center(
              child: Container(
                width: 611.w,
                height: 530.h,
                decoration: BoxDecoration(color: Color(0XFFD9D9D9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

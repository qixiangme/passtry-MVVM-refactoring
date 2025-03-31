import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(77.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.h),
                    Row(
                      children: [
                        Text(
                          '스터디',
                          style: TextStyle(
                            color: const Color(0xFF353C49),
                            fontSize: 44.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.44.w,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 55.w,
                          height: 54.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset(
                            'assets/icons/cup_star.png',
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 100.h),
                    InkWell(
                      onTap: () {
                        print('Container clicked!');
                      },
                      child: Container(
                        width: 988.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 77.w,
                          vertical: 50.h,
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.75.w,
                              color: const Color(0xFFD8DCE2),
                            ),
                            borderRadius: BorderRadius.circular(38.50.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 30.h,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 30.h,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 51.h,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 207.w,
                                      children: [
                                        Container(
                                          width: 400.w,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: 32.h,
                                            children: [
                                              SizedBox(
                                                width: 400.w,
                                                child: Text(
                                                  'Groupname',
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFF1C1C1C,
                                                    ),
                                                    fontSize: 44.sp,
                                                    fontFamily: 'Wanted Sans',
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: -0.44,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 400.w,
                                                child: Text(
                                                  '학술 분야, 연합동아리, 난이도 중, \n최근 트렌드 포함',
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFF6B6B6B,
                                                    ),
                                                    fontSize: 30.sp,
                                                    fontFamily: 'Wanted Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 4.0.h,
                                                    letterSpacing: -0.35,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 150.w,
                                          height: 150.h,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFD8DCE2),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    83.50.r,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                Container(
                                  width: 449.39.w,
                                  padding: EdgeInsets.only(
                                    left: 19.w,
                                    right: 23.w,
                                  ),

                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 131.w,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        spacing: 27.w,
                                        children: [
                                          Container(
                                            width: 49.39.w,
                                            height: 48.h,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(),
                                            child: Image.asset(
                                              'assets/icons/calendar.png',
                                            ),
                                          ),

                                          Text(
                                            '4/5',
                                            style: TextStyle(
                                              color: const Color(0xFF6B6B6B),
                                              fontSize: 36.sp,
                                              fontFamily: 'Wanted Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 3.33.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        spacing: 27.w,
                                        children: [
                                          Container(
                                            width: 49.39.w,
                                            height: 48.h,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(),
                                            child: Image.asset(
                                              'assets/icons/small_man.png',
                                            ),
                                          ),
                                          Text(
                                            '6명',
                                            style: TextStyle(
                                              color: const Color(0xFF6B6B6B),
                                              fontSize: 36.sp,
                                              fontFamily: 'Wanted Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 3.33.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

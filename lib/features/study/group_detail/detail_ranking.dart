import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailRanking extends StatefulWidget {
  const DetailRanking({super.key});

  @override
  State<DetailRanking> createState() => _DetailRankingState();
}

class _DetailRankingState extends State<DetailRanking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 1080.w,
              height: 2906.h,
              decoration: BoxDecoration(color: const Color(0xFF434343)),
            ),
          ),
          Positioned(
            left: 0.w,
            top: 0.h,
            child: Container(
              width: 1080.w,
              height: 105.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 726.w,
                    top: 36.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6.w,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-1.57),
                          height: 48.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 200.h,
            child: Opacity(
              opacity: 0.10.w,
              child: Container(
                width: 992.w,
                height: 258.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50.w),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 1100.h,
            child: Opacity(
              opacity: 0.10.w,
              child: Container(
                width: 992.w,
                height: 258.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50.w),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 500.h,
            child: Opacity(
              opacity: 0.10.w,
              child: Container(
                width: 992.w,
                height: 258.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50.w),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 1400.h,
            child: Opacity(
              opacity: 0.10.w,
              child: Container(
                width: 992.w,
                height: 258.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50.w),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 66.w,
            top: 80.h,
            child: Text(
              '우리 스터디 순위는?',
              style: TextStyle(
                color: Colors.white /* white */,
                fontSize: 50.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 66.w,
            top: 1000.h,
            child: Text(
              '오늘 제일 열심히 준비한 팀원은?',
              style: TextStyle(
                color: Colors.white /* white */,
                fontSize: 50.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 193.w,
            top: 215.h,
            child: Opacity(
              opacity: 0.50.w,
              child: Container(
                width: 781.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 315.w,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 42.w,
                      children: [
                        Container(
                          width: 150.w,
                          height: 150.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://placehold.co/150x150",
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1.68.w,
                                color: const Color(0xFFC4CAD4) /* gray */,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 23.w,
                            children: [
                              Text(
                                'Groupname',
                                style: TextStyle(
                                  color: Colors.white /* white */,
                                  fontSize: 50.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: 123.31.w,
                                height: 66.65.h,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23.65,
                                  vertical: 11.83,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(
                                    0xFF6B6B6B,
                                  ) /* dark-gray */,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.96.w,
                                      color: const Color(0xFFC4CAD4) /* gray */,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      29.57.w,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 29.57.w,
                                  children: [
                                    Text(
                                      'level',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(
                                          0xFFC4CAD4,
                                        ) /* gray */,
                                        fontSize: 36.w,
                                        fontFamily: 'Wanted Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '1000 p',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white /* white */,
                        fontSize: 50.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.50.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 193.w,
            top: 1150.h,
            child: Container(
              width: 781.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 315.w,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 42.w,
                    children: [
                      Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/150x150"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 1.68.w,
                              color: const Color(0xFFC4CAD4) /* gray */,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 241.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 23.w,
                          children: [
                            SizedBox(
                              width: 241.w,
                              height: 60.h,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  color: Colors.white /* white */,
                                  fontSize: 50.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: 123.31.w,
                              height: 66.65.h,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 23.65,
                                vertical: 11.83,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF6B6B6B) /* dark-gray */,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.96.w,
                                    color: const Color(0xFFC4CAD4) /* gray */,
                                  ),
                                  borderRadius: BorderRadius.circular(29.57.w),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 29.57.w,
                                children: [
                                  Text(
                                    'level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFFC4CAD4) /* gray */,
                                      fontSize: 36.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '20 p',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white /* white */,
                      fontSize: 50.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.50.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 193.w,
            top: 500.h,
            child: Container(
              width: 781.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 315.w,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 42.w,
                    children: [
                      Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/150x150"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 1.68.w,
                              color: const Color(0xFFC4CAD4) /* gray */,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 23.w,
                          children: [
                            Text(
                              'Groupname',
                              style: TextStyle(
                                color: Colors.white /* white */,
                                fontSize: 50.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: 123.31.w,
                              height: 66.65.h,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 23.65,
                                vertical: 11.83,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF6B6B6B) /* dark-gray */,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.96.w,
                                    color: const Color(0xFFC4CAD4) /* gray */,
                                  ),
                                  borderRadius: BorderRadius.circular(29.57.w),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 29.57.w,
                                children: [
                                  Text(
                                    'level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFFC4CAD4) /* gray */,
                                      fontSize: 36.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '988 p',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white /* white */,
                      fontSize: 50.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.50.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 193.w,
            top: 1450.h,
            child: Container(
              width: 781.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 315.w,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 42.w,
                    children: [
                      Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/150x150"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 1.68.w,
                              color: const Color(0xFFC4CAD4) /* gray */,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 241.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 23.w,
                          children: [
                            SizedBox(
                              width: 241.w,
                              height: 60.h,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  color: Colors.white /* white */,
                                  fontSize: 50.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: 123.31.w,
                              height: 66.65.h,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 23.65,
                                vertical: 11.83,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF6B6B6B) /* dark-gray */,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.96.w,
                                    color: const Color(0xFFC4CAD4) /* gray */,
                                  ),
                                  borderRadius: BorderRadius.circular(29.57.w),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 29.57.w,
                                children: [
                                  Text(
                                    'level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFFC4CAD4) /* gray */,
                                      fontSize: 36.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '15 p',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white /* white */,
                      fontSize: 50.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.50.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 85.w,
            top: 300.h,
            child: Opacity(
              opacity: 0.50.w,
              child: Text(
                '26',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white /* white */,
                  fontSize: 55.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.55.w,
                ),
              ),
            ),
          ),
          Positioned(
            left: 104.w,
            top: 1200.h,
            child: Text(
              '1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFF9F1C) /* main-orange */,
                fontSize: 55.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.55.h,
              ),
            ),
          ),
          Positioned(
            left: 85.w,
            top: 600.h,
            child: Text(
              '27',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFF9F1C) /* main-orange */,
                fontSize: 55.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.55.w,
              ),
            ),
          ),
          Positioned(
            left: 100.w,
            top: 1500.h,
            child: Text(
              '2',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white /* white */,
                fontSize: 55.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.55.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

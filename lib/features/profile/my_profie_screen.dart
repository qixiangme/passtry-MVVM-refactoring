import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfieScreen extends StatelessWidget {
  const MyProfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080.w,
      height: 2400.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 0.w,
            top: 1192.h,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 1080.w,
                height: 1208.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEBEB) /* light-gray */,
                ),
              ),
            ),
          ),
          Positioned(
            left: 80.w,
            top: 1252.h,
            child: Container(
              width: 193.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 61.w,
                children: [
                  SizedBox(
                    width: 193.w,
                    child: Text(
                      '공지사항',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 193.w,
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 193.w,
                    child: Text(
                      '약관 및 정책',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 193.w,
                    child: Text(
                      '버전 정보',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 918.w,
            top: 1579.h,
            child: Text(
              '1.0.0',
              style: TextStyle(
                color: const Color(0xFF6B6B6B) /* dark-gray */,
                fontSize: 40.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 791.h,
            child: Container(
              width: 992.w,
              height: 152.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFC4CAD4) /* gray */,
                  ),
                  borderRadius: BorderRadius.circular(38.50),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 148.w,
                    top: 52.h,
                    child: Text(
                      '내가 작성한 예상 답안',
                      style: TextStyle(
                        color: const Color(0xFF1C1C1C) /* main-black */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 805.w,
                    top: 46.h,
                    child: Text(
                      '20',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 50.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36.w,
                    top: 36.h,
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                    ),
                  ),
                  Positioned(
                    left: 903.w,
                    top: 62.h,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 967.h,
            child: Container(
              width: 992.w,
              height: 152.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFC4CAD4) /* gray */,
                  ),
                  borderRadius: BorderRadius.circular(38.50),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 146.w,
                    top: 52.h,
                    child: Text(
                      '완성한 빵 레시피',
                      style: TextStyle(
                        color: const Color(0xFF1C1C1C) /* main-black */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 836.w,
                    top: 46.h,
                    child: Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 50.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36.w,
                    top: 36.h,
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                    ),
                  ),
                  Positioned(
                    left: 903.w,
                    top: 60.h,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 615.h,
            child: Container(
              width: 992.w,
              height: 152.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFC4CAD4) /* gray */,
                  ),
                  borderRadius: BorderRadius.circular(38.50),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 146.w,
                    top: 52.h,
                    child: Text(
                      '목표',
                      style: TextStyle(
                        color: const Color(0xFF1C1C1C) /* main-black */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36.w,
                    top: 36.h,
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                    ),
                  ),
                  Positioned(
                    left: 903.w,
                    top: 60.h,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 559.w,
                    top: 55.h,
                    child: Text(
                      '#교내동아리',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.05.h,
                        letterSpacing: -0.40.w,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 775.w,
                    top: 55.h,
                    child: Text(
                      '#학술',
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.05.h,
                        letterSpacing: -0.40.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            top: 2150.h,
            child: Container(
              width: 1080.w,
              height: 250.h,
              padding: const EdgeInsets.only(bottom: 60.50),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 51.43,
                    offset: Offset(0, -5.50),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 189.75.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 46.75,
                      vertical: 13.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 27.50.h,
                      children: [
                        Container(
                          width: 121.w,
                          height: double.infinity.h,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 49.50,
                            vertical: 13.75,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 22.h,
                            children: [
                              Container(
                                width: 66.w,
                                height: 66.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                              Text(
                                '홈',
                                style: TextStyle(
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                  fontSize: 33.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 189.75.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 46.75,
                      vertical: 13.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 27.50.h,
                      children: [
                        Container(
                          width: 121.w,
                          height: double.infinity.h,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 49.50,
                            vertical: 13.75,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 22.h,
                            children: [
                              Text(
                                '스터디',
                                style: TextStyle(
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                  fontSize: 33.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 189.75.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 46.75,
                      vertical: 13.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 27.50.h,
                      children: [
                        Container(
                          width: 121.w,
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 49.50,
                            vertical: 13.75,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 22.h,
                            children: [
                              Container(
                                width: 66.w,
                                height: 66.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                              Text(
                                '베이킹',
                                style: TextStyle(
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                  fontSize: 33.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 189.75.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 46.75,
                      vertical: 13.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 27.50.h,
                      children: [
                        Container(
                          width: 121.w,
                          height: double.infinity.h,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 49.50,
                            vertical: 13.75,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 22.h,
                            children: [
                              Container(
                                width: 66.w,
                                height: 66.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                              Text(
                                '탐색',
                                style: TextStyle(
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                  fontSize: 33.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 189.75.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 46.75,
                      vertical: 13.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 27.50.h,
                      children: [
                        Container(
                          width: 121.w,
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 49.50,
                            vertical: 13.75,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 22.h,
                            children: [
                              Text(
                                '마이',
                                style: TextStyle(
                                  color: const Color(
                                    0xFFFF9F1C,
                                  ) /* main-orange */,
                                  fontSize: 33.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w500,
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
            ),
          ),
          Positioned(
            left: 0.w,
            top: 135.h,
            child: Container(
              width: 1080.w,
              height: 120.h,
              padding: const EdgeInsets.only(
                top: 13.75,
                left: 55,
                right: 77,
                bottom: 13.75,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 49.50.h,
                children: [
                  SizedBox(
                    width: 717.w,
                    child: Text(
                      '마이페이지',
                      style: TextStyle(
                        color: const Color(0xFF1C1C1C) /* main-black */,
                        fontSize: 60.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.60.w,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Container(
                      width: 66.w,
                      height: 66.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Container(
                    width: 66.w,
                    height: 66.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(),
                  ),
                ],
              ),
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
                    left: 60.w,
                    top: 36.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 15.w,
                      children: [
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
                          width: 15.w,
                          height: 15.h,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 726.w,
                    top: 36.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6.h,
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
                  Positioned(
                    left: 510.w,
                    top: 27.h,
                    child: Container(
                      width: 63.w,
                      height: 63.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0.w,
                            top: 0.h,
                            child: Container(
                              width: 63.w,
                              height: 63.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18.w,
                            top: 18.h,
                            child: Container(
                              width: 27.w,
                              height: 27.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF2E2C2C),
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xFF3E3C3C),
                                    blurRadius: 12,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 361.w,
            top: 352.h,
            child: Text(
              'Username',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50.w,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 361.w,
            top: 442.h,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 23.65,
                vertical: 11.83,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0x21FF9F1C),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.96.w,
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                  ),
                  borderRadius: BorderRadius.circular(29.57),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 29.57,
                children: [
                  Text(
                    'level',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFF9F1C) /* main-orange */,
                      fontSize: 36.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 510.w,
            top: 442.h,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 23.65,
                vertical: 11.83,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0x21FF9F1C),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.96.w,
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                  ),
                  borderRadius: BorderRadius.circular(29.57),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 29.57.h,
                children: [
                  Text(
                    '1234 P',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFF9F1C) /* main-orange */,
                      fontSize: 36.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 60.w,
            top: 307.h,
            child: Container(
              width: 245.w,
              height: 245.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/245x245"),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 2.75.w,
                    color: const Color(0xFFC4CAD4) /* gray */,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 968.w,
            top: 1260.h,
            child: Container(
              width: 32.w,
              height: 32.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(),
            ),
          ),
          Positioned(
            left: 968.w,
            top: 1369.h,
            child: Container(
              width: 32.w,
              height: 32.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(),
            ),
          ),
          Positioned(
            left: 968.w,
            top: 1478.h,
            child: Container(
              width: 32.w,
              height: 32.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(),
            ),
          ),
        ],
      ),
    );
  }
}

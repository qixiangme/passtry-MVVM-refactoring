import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailLive extends StatefulWidget {
  const DetailLive({super.key});

  @override
  State<DetailLive> createState() => _DetailLiveState();
}

class _DetailLiveState extends State<DetailLive> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 1080.w,
        height: 2893.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              top: 381.h,
              child: Container(
                width: 1080.w,
                height: 2906.h,
                decoration: BoxDecoration(color: const Color(0xFF434343)),
              ),
            ),
            Positioned(
              left: 44.w,
              top: 289.h,
              child: Container(width: 318.w, height: 89.h),
            ),
            Positioned(
              left: 381.w,
              top: 289.h,
              child: Container(width: 318.w, height: 89.h),
            ),
            Positioned(
              left: 722.w,
              top: 289.h,
              child: Container(width: 314.w, height: 89.h),
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
                decoration: BoxDecoration(color: Colors.white /* white */),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 49.50.w,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                    SizedBox(
                      width: 749.w,
                      child: Text(
                        'group name ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C) /* main-black */,
                          fontSize: 55.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.55,
                        ),
                      ),
                    ),
                    Container(
                      width: 50.w,
                      height: 50.h,
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
              left: 476.w,
              top: 287.h,
              child: Text(
                '실시간',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.50,
                ),
              ),
            ),
            Positioned(
              left: 179.w,
              top: 287.h,
              child: Text(
                '홈',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6B6B6B) /* dark-gray */,
                  fontSize: 50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.50,
                ),
              ),
            ),
            Positioned(
              left: 836.w,
              top: 287.h,
              child: Text(
                '랭킹',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6B6B6B) /* dark-gray */,
                  fontSize: 50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.50,
                ),
              ),
            ),
            Positioned(
              left: 49.w,
              top: 651.h,
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/130x130"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1.46.w,
                      color: const Color(0xFFC4CAD4) /* gray */,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 49.w,
              top: 1595.h,
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/130x130"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1.46.w,
                      color: const Color(0xFFC4CAD4) /* gray */,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 906.w,
              top: 1130.h,
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/130x130"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1.46.w,
                      color: const Color(0xFFC4CAD4) /* gray */,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 213.w,
              top: 663.h,
              child: Text(
                'Username',
                style: TextStyle(
                  color: Colors.white /* white */,
                  fontSize: 44.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 213.w,
              top: 1607.h,
              child: Text(
                'Username',
                style: TextStyle(
                  color: Colors.white /* white */,
                  fontSize: 44.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 842.w,
              top: 1439.h,
              child: Opacity(
                opacity: 0.10.w,
                child: Container(
                  width: 793.w,
                  height: 244.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38.50),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 281.w,
              top: 792.h,
              child: Container(
                width: 312.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 32.w,
                  children: [
                    SizedBox(
                      width: 312.w,
                      child: Text(
                        '일일 퀘스트 완료 🥐',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 312.w,
                      child: Text(
                        '15p를 얻었어요',
                        style: TextStyle(
                          color: Colors.white,
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
              left: 281.w,
              top: 1736.h,
              child: Container(
                width: 312.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 32.w,
                  children: [
                    Text(
                      '면접 답변 20개 준비 완료! 🥐',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '면접 고수가 되어가고 있어요!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 109.w,
              top: 1266.h,
              child: Container(
                width: 312.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 32.w,
                  children: [
                    Text(
                      '‘levelname’으로 레벨업! ☀️',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 312.w,
                      child: Text(
                        '축하해 주세요!',
                        style: TextStyle(
                          color: Colors.white,
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
              left: 872.w,
              top: 1008.h,
              child: Text(
                '5분 전',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFC4CAD4) /* gray */,
                  fontSize: 38.50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 846.w,
              top: 1952.h,
              child: Text(
                '40분 전',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFC4CAD4) /* gray */,
                  fontSize: 38.50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 109.w,
              top: 1473.h,
              child: Text(
                '30분 전',
                style: TextStyle(
                  color: const Color(0xFFC4CAD4) /* gray */,
                  fontSize: 38.50.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 364.w,
              top: 481.h,
              child: Container(
                width: 353.w,
                height: 77.h,
                decoration: ShapeDecoration(
                  color: Colors.black.withValues(alpha: 89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 56.w,
                      top: 18.h,
                      child: Text(
                        '2025년 4월 2일',
                        style: TextStyle(
                          color: const Color(0xFFEBEBEB) /* light-gray */,
                          fontSize: 36.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                          height: 1.17.h,
                          letterSpacing: -0.36,
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
    );
  }
}

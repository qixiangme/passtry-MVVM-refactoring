import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailLive extends StatefulWidget {
  final GroupModel groupModel;

  const DetailLive({super.key, required this.groupModel});
  

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
        // clipBehavior: Clip.antiAlias,
        // decoration: BoxDecoration(color: Color(0xff000000)),
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 49.w,
              top: 300.h, // 첫 번째 사람 프로필 사진
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
              top: 300.h,
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
              left: 200.w,
              top: 380.h, // 첫 번째 대화 박스
              child: Opacity(
                opacity: 0.10.w,
                child: Container(
                  width: 793.w,
                  height: 244.h,
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
              left: 281.w,
              top: 420.h,
              child: Container(
                width: 350.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25.w,
                  children: [
                    SizedBox(
                      width: 350.w,
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
              left: 872.w,
              top: 650.h,
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
              left: 364.w,
              top: 100.h,
              child: Container(
                width: 353.w,
                height: 77.h,
                decoration: ShapeDecoration(
                  color: Color(0xff000000).withOpacity(0.35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.50),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 56.w,
                      top: 25.h,
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupComplete extends StatefulWidget {
  const StudyMakeGroupComplete({super.key});

  @override
  State<StudyMakeGroupComplete> createState() => _StudyMakeGroupComplete();
}

class _StudyMakeGroupComplete extends State<StudyMakeGroupComplete> {

  Widget _buildGroupImage(Map<String, dynamic> args) {
    try {
      if (args.containsKey('imagePath') && args['imagePath'] is String) {
        final String imagePath = args['imagePath'] as String;
        final File groupImageFile = File(imagePath);

        if (groupImageFile.existsSync()) {
          print('Image file exists: ${groupImageFile.path}');
          return Container(
            width: 538.w,
            height: 538.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(groupImageFile), // FileImage 사용
                fit: BoxFit.contain,
              ),
            ),
          );
        } else {
          print('Image file does not exist: $imagePath');
          return Container(
            width: 538.w,
            height: 538.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/add_image_circle.png'), // AssetImage 사용
                fit: BoxFit.contain,
              ),
            ),
          );
        }
      } else {
        print('Invalid or missing image path.');
        return Container(
          width: 538.w,
          height: 538.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/add_image_circle.png'), // AssetImage 사용
              fit: BoxFit.contain,
            ),
          ),
        );
      }
    } catch (e) {
      print('Error loading image: $e');
      return Container(
        width: 538.w,
        height: 538.h,
        child: Center(
          child: Text('이미지 로드 실패'), // 오류 메시지 표시
        ),
      );
    }
  }

  @override

  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String groupName = args['groupName'];


    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildGroupImage(args),
            SizedBox(height: 100.h),
            Text(
              '$groupName 을 \n오픈했어요!',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 100.h),

            Container(
              width: 396.w,
              height: 104.h,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3.w, color: const Color(0xFFFF9F1C)),
                  borderRadius: BorderRadius.circular(52.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 24.75.w,
                children: [
                  Text(
                    '빵집 주소 :',
                    style: TextStyle(
                      color: const Color(0xFFFF9F1C),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.44,
                    ),
                  ),
                  Text(
                    '0318',
                    style: TextStyle(
                      color: const Color(0xFFFF9F1C),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.44,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Image.asset(
              'assets/images/triangle.png',
              width: 50.w,
              height: 25.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.w,
                children: [
                  Text(
                    '함께 하고 싶은 친구들에게 공유하세요 🥐',
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: 38.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.38,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 486.w,
                  height: 160.h,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 27.50.w,
                    children: [
                      Text(
                        '확인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.sp,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w,),
                Container(
                  width: 486.w,
                  height: 160.h,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Colors.white /* white */,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFFF9F1C) /* main-orange */,
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 27.50,
                    children: [
                      Text(
                        '게시글로 공유하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFF9F1C) /* main-orange */,
                          fontSize: 50.sp,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ],
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

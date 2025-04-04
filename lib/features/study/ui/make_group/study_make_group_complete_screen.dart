import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyMakeGroupComplete extends StatefulWidget {
  const StudyMakeGroupComplete({super.key});

  @override
  State<StudyMakeGroupComplete> createState() => _StudyMakeGroupComplete();
}

class _StudyMakeGroupComplete extends State<StudyMakeGroupComplete> {
  /// 이미지 표시 위젯
  Widget _buildGroupImage(File? imageFile) {
    if (imageFile != null && imageFile.existsSync()) {
      return Container(
        width: 538.w,
        height: 538.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(imageFile), // FileImage 사용
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      return _buildDefaultImage();
    }
  }

  /// 기본 이미지 표시
  Widget _buildDefaultImage() {
    return Container(
      width: 538.w,
      height: 538.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/add_image_circle.png'), // 기본 이미지
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// 그룹 업로드 메서드
  Future<void> _uploadGroup(Map<String, dynamic> args) async {
    final String groupName = args['groupName'] ?? '그룹 이름 없음';
    final String? imagePath = args['imagePath'] as String?;
    final File? imageFile = imagePath != null ? File(imagePath) : null;

    var uri = Uri.parse("http://34.64.233.128:5200/groups"); // 🔥 엔드포인트 설정

    var request =
        http.MultipartRequest("POST", uri)
          ..fields['authorId'] = "1234"
          ..fields['name'] = groupName
          ..fields['joinCode'] = "ABCD"
          ..fields['tags'] = '["tag1", "tag2"]'; // JSON 문자열 형태

    if (imageFile != null) {
      print(request);

      request.files.add(
        await http.MultipartFile.fromPath(
          "image",
          imageFile.path,
          filename: basename(imageFile.path),
          contentType: MediaType('image', 'jpeg'), 
        ),
      );

      try {
        var response = await request.send(); // 🚀 요청 전송
        var responseBody = await response.stream.bytesToString(); // 응답 읽기
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 전달받은 arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String groupName = args['groupName'] ?? '그룹 이름 없음';
    final String? imagePath = args['imagePath'] as String?; // 파일 경로 받기
    final File? imageFile =
        imagePath != null ? File(imagePath) : null; // File 객체 생성

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 이미지 표시
            _buildGroupImage(imageFile),
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
            GestureDetector(
              onTap: () => _uploadGroup(args),
              child: Container(
                width: 486.w,
                height: 160.h,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF9F1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    '그룹 업로드',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

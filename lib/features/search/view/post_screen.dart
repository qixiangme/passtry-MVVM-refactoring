import 'package:componentss/features/search/data/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostScreen extends StatefulWidget {
  final PostModel post;
  const PostScreen({super.key, required this.post});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Map<int, Map<String, String>> categoryDict = {
    0: {'icon': '💻', 'text': '전공'},
    1: {'icon': '📚', 'text': '학술'},
    2: {'icon': '🎨', 'text': '예술'},
    3: {'icon': '👥', 'text': '취미'},
    4: {'icon': '☀️', 'text': '봉사'},
    5: {'icon': '🔠', 'text': '어학'},
    6: {'icon': '🤝', 'text': '창업'},
    7: {'icon': '✈️', 'text': '여행'},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 25),
              CircleAvatar(radius: 55.r),
              SizedBox(width: 10),
              Text(
                widget.post.userId,
                style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 17),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                widget.post.title,
                style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 10),

          Row(
            children: [
              SizedBox(width: 30),
              Expanded(child: Text(widget.post.content)),
            ],
          ),
          SizedBox(height: 20),

          Center(
            child: SizedBox(
              width: 935.w,
              height: 800.h,
              child: Image.network(
                widget.post.imageUrl ?? '',
                fit: BoxFit.contain,
              ),
            ), // 이미지 URL을 사용하여 이미지를 표시
          ),
          SizedBox(height: 40),

          Row(
            children: [
              SizedBox(width: 30),
              SizedBox(
                width: 935.w,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 18,
                  spacing: 6,
                  children:
                      widget.post.tags.map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 36.r,
                            vertical: 18.r,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white /* white */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3.w,
                                color: const Color(0xFFEBEBEB) /* light-gray */,
                              ),
                              borderRadius: BorderRadius.circular(36.r),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '🔖 ', // 태그 아이콘 (예시)
                                style: TextStyle(
                                  color: const Color(
                                    0xFF6B6B6B,
                                  ) /* dark-gray */,
                                  fontSize: 36.sp,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                tag, // 태그 텍스트
                                style: TextStyle(
                                  color: const Color(
                                    0xFF6B6B6B,
                                  ) /* dark-gray */,
                                  fontSize: 36.sp,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(), // map 결과를 리스트로 변환
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

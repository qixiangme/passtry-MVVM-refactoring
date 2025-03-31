import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

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
                "유저이름",
                style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 17),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                "게시물 제목",
                style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 20),
              Expanded(child: Text("본문내용 \n본문내용")),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 20),
              SizedBox(
                width: 935.w,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 18,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.r,
                        vertical: 26.r,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white /* white */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.75.w,
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
                            '👥',
                            style: TextStyle(
                              color: const Color(0xFF6B6B6B) /* dark-gray */,
                              fontSize: 36.sp,
                              fontFamily: 'Wanted Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '문화•취미',
                            style: TextStyle(
                              color: const Color(0xFF6B6B6B) /* dark-gray */,
                              fontSize: 36.sp,
                              fontFamily: 'Wanted Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.r,
                        vertical: 26.r,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white /* white */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.75.w,
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
                            '✈️',
                            style: TextStyle(
                              color: const Color(0xFF6B6B6B) /* dark-gray */,
                              fontSize: 36.sp,
                              fontFamily: 'Wanted Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '여행',
                            style: TextStyle(
                              color: const Color(0xFF6B6B6B) /* dark-gray */,
                              fontSize: 36.sp,
                              fontFamily: 'Wanted Sans',
                              fontWeight: FontWeight.w600,
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
        ],
      ),
    );
  }
}

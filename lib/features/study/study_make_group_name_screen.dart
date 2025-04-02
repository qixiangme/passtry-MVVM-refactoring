import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupName extends StatefulWidget {
  const StudyMakeGroupName({super.key});

  @override
  State<StudyMakeGroupName> createState() => _StudyMakeGroupName();
}

class _StudyMakeGroupName extends State<StudyMakeGroupName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(CustomIcon.back, size: 18),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Text(
                  '빵집 이름을 지어주세요',
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
                    fontSize: 70.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 200.h),
                Center(
                  child: Container(
                    width: 440.w,
                    height: 440.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/add_image_circle.png'),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),),
                SizedBox(height: 50.h),
                Center(
                  child: Container(
                    width: 900.w,
                    height: 200.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 110.h,
                      children: [
                        Container(
                          width: 904.75.w,
                          padding: const EdgeInsets.only(top: 27.50),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 27.50.h,
                            children: [
                              SizedBox(
                                width: 904.75.w,
                                child: Text(
                                  'ex) 면접 만점 암기빵 맛집',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF8E95A2),
                                    fontSize: 44.sp,
                                    fontFamily: 'Wanted Sans',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.44,
                                  ),
                                ),
                              ),
                              Container(
                                width: 970.75.w,
                                height: 5.50.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD8DCE2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

import 'dart:io';

import 'package:componentss/features/search/data/post_api.dart';
import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  File? _selectedImage;

  Future<void> getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      File image = File(file.path);
      setState(() {
        _selectedImage = image;
      });
      print("이미지 선택 성공: ${image.path}");
    } else {
      print("이미지 선택 취소");
    }
  }

  final PostApi _postApi = PostApi();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
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
  List<bool> tagSelection = List.generate(8, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(CustomIcon.add),
            onTap: () async {
              final List<String> selectedTags = [];
              for (int i = 0; i < tagSelection.length; i++) {
                if (tagSelection[i]) {
                  selectedTags.add(categoryDict[i]!['text']!);
                }
              }
              final DateTime now = DateTime.now();
              final post = PostModel(
                "0",
                now.toString(),
                0,
                selectedTags,
                title: _titleTextController.text,
                content: _textController.text,
                images: _selectedImage,
                id: "0",
              );

              final isSuccess = await _postApi.uploadPostWithFile(post);

              Navigator.pop(context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(CustomIcon.back),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h), // 화면 밀도 적용
          Center(
            child: Container(
              width: 992.w, // 화면 밀도 적용
              height: 119.h, // 화면 밀도 적용
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC4CAD4)),
                borderRadius: BorderRadius.all(
                  Radius.circular(38.5.r),
                ), // 화면 밀도 적용
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 3),
                child: TextField(
                  controller: _titleTextController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 42.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6B6B6B),
                    ),
                    hintText: "제목(20자 이내)",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35.h), // 화면 밀도 적용
          Center(
            child: Container(
              width: 992.w, // 화면 밀도 적용
              height: 720.h, // 화면 밀도 적용
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC4CAD4)),
                borderRadius: BorderRadius.all(
                  Radius.circular(38.5.r),
                ), // 화면 밀도 적용
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 3),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B6B6B),
                    ),
                    hintText: "본문(300자 이내)",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h), // 화면 밀도 적용
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 85.w), // 화면 밀도 적용
              Text(
                "태그",
                style: TextStyle(
                  fontSize: 44.sp, // 화면 밀도 적용
                  color: Color(0XFF6B6B6B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 935.w, // 화면 밀도 적용
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              spacing: 18.r, // 화면 밀도 적용
              runSpacing: 18.r, // 화면 밀도 적용
              children: List.generate(8, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tagSelection[index] = !tagSelection[index];
                    });
                  },
                  child: Container(
                    width: 200.w,
                    height: 100.h,
                    decoration: ShapeDecoration(
                      color:
                          tagSelection[index]
                              ? Color(0x21FF9F1C) // 주황색
                              : Colors.white, // 회색

                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.75.w, // 화면 밀도 적용
                          color:
                              tagSelection[index]
                                  ? Color(0xFFFF9F1C) // 주황색
                                  : Color(0xFFECECEC), // 회색
                        ),
                        borderRadius: BorderRadius.circular(36.r), // 화면 밀도 적용
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          categoryDict[index]!['icon']!,
                          style: TextStyle(
                            color:
                                tagSelection[index]
                                    ? Color(0xFF1C1C1C)
                                    : Color(0xFF6B6B6B),
                            fontSize: 36.sp, // 화면 밀도 적용
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.36,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          categoryDict[index]!['text']!,
                          style: TextStyle(
                            color:
                                tagSelection[index]
                                    ? Color(0xFF1C1C1C)
                                    : Color(0xFF6B6B6B),
                            fontSize: 36.sp, // 화면 밀도 적용
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 90.w),
              Text(
                "사진",
                style: TextStyle(
                  fontSize: 44.sp, // 화면 밀도 적용
                  color: Color(0XFF6B6B6B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 17),
              Padding(
                padding: EdgeInsets.only(top: 1.5),
                child: Text(
                  "*최대 2장까지 가능합니다.",
                  style: TextStyle(
                    fontSize: 39.sp, // 화면 밀도 적용
                    color: Color(0XFFC4CAD4),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13),
          Row(
            children: [
              SizedBox(width: 30),
              SizedBox(
                width: 242.w,
                height: 242.h,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: Container(
                        width: 242.w,
                        height: 242.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC4CAD4) /* gray */,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child:
                            _selectedImage != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover, // 이미지가 박스에 맞게 표시되도록 설정
                                  ),
                                )
                                : null,
                      ),
                    ),

                    Visibility(
                      visible: _selectedImage == null,
                      child: Positioned(
                        left: 95.r,
                        top: 95.r,
                        child: Container(
                          width: 53.w,
                          height: 53.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Center(
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 242.w,
                height: 242.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 242.w,
                        height: 242.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC4CAD4) /* gray */,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95.r,
                      top: 95.r,
                      child: Container(
                        width: 53.w,
                        height: 53.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Center(
                          child: Icon(Icons.add, color: Colors.white),
                        ),
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

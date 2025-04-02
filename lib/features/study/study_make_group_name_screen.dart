import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:image_picker/image_picker.dart';

class StudyMakeGroupName extends StatefulWidget {
  const StudyMakeGroupName({super.key});

  @override
  State<StudyMakeGroupName> createState() => _StudyMakeGroupName();
}

class _StudyMakeGroupName extends State<StudyMakeGroupName> {
  File? _selectedImage;

  void _handleImageSelected(File? image) {
    setState(() {
      _selectedImage = image;
    });
  }

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
                  child: AddImageContainer(
                    onImageSelected: _handleImageSelected,
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 900.w,
                    height: 200.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 110.h,
                      children: [
                        Center(
                          child: Container(
                            width: 904.75.w,
                            padding: const EdgeInsets.only(top: 15),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 27.50.h,
                              children: [
                                SizedBox(
                                  width: 900.w,
                                  child: TextField(
                                    onChanged: (text) {
                                      // 텍스트가 변경될 때 호출되는 콜백 함수
                                      print("입력된 텍스트: $text");
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'ex) 면접 만점 암기빵 맛집',
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF8E95A2),
                                        fontSize: 44.sp,
                                        fontFamily: 'Wanted Sans',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.44,
                                      ),
                                      border: UnderlineInputBorder(
                                        // 밑줄 테두리 추가
                                        borderSide: BorderSide(
                                          color:
                                              Colors.grey.shade200, // 테두리 색상 설정
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade900,
                                        ), // 원하는 색상으로 변경
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,
                                    // 키보드 타입 설정
                                    obscureText: false,
                                    // 비밀번호 입력 모드 여부
                                    maxLines: 1,
                                    // 최대 줄 수
                                    autocorrect: false,

                                    /*Text(
                                  'ex) 면접 만점 암기빵 맛집',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF8E95A2),
                                    fontSize: 44.sp,
                                    fontFamily: 'Wanted Sans',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.44,
                                  ),
                                ),*/
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddImageContainer extends StatefulWidget {
  final Function(File?) onImageSelected; // 콜백 함수 추가

  const AddImageContainer({super.key, required this.onImageSelected});

  @override
  _AddImageContainerState createState() => _AddImageContainerState();
}

class _AddImageContainerState extends State<AddImageContainer> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      File image = File(file.path);
      setState(() {
        _image = image;
      });
      widget.onImageSelected(image);
    } else {
      // Handle the case where no image was selected
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: Container(
        width: 440.w,
        height: 440.h,
        decoration: BoxDecoration(
          image:
              _image != null
                  ? DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  )
                  : DecorationImage(
                    image: AssetImage('assets/images/add_image_circle.png'),
                    fit: BoxFit.cover,
                  ),
        ),
      ),
    );
  }
}


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
      print("이미지 선택됨: ${image.path}"); // 이미지 경로 출력
      print(image.path);
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
        width: 450.w,
        height: 450.h,
        decoration: BoxDecoration(
          image:
              _image != null
                  ? DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.contain,
                  )
                  : DecorationImage(
                    image: AssetImage('assets/images/add_image_circle.png'),
                    fit: BoxFit.contain,
                  ),
        ),
      ),
    );
  }
}

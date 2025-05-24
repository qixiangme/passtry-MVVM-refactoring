// import 'dart:io'; // File 사용 안 하므로 제거
import 'package:componentss/features/baking/viewmodel/baking_setting_view_model.dart';
// import 'package:componentss/features/study/data/group_model.dart'; // GroupModel 사용하지 않으므로 제거 (필요시 유지)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
// import 'package:image_picker/image_picker.dart'; // ImagePicker 사용 안 하므로 제거
// import 'package:path/path.dart' as path; // path 사용 안 하므로 제거
// import 'package:http_parser/http_parser.dart'; // MediaType 사용 안 하므로 제거
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyMakeGroupName extends ConsumerStatefulWidget {
  const StudyMakeGroupName({super.key});

  @override
  ConsumerState<StudyMakeGroupName> createState() => _StudyMakeGroupName();
}

class _StudyMakeGroupName extends ConsumerState<StudyMakeGroupName> {
  // File? _selectedImage; // 이미지 관련 상태 제거

  // void _handleImageSelected(File? image) { // 이미지 선택 핸들러 제거
  //   setState(() {
  //     _selectedImage = image;
  //     _updateNextButtonState();
  //   });
  // }

 

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(StudyMakeViewModelProvider);
    final vm = ref.watch(StudyMakeViewModelProvider.notifier);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 77.w), // ScreenUtil 적용
          child: Column(
            // Stack 제거 (단순 구조)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h), // ScreenUtil 적용
              Text(
                '빵집 이름을 지어주세요',
                style: TextStyle(
                  color: const Color(0xFF1F1F1F),
                  fontSize: 70.sp, // ScreenUtil 적용
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 200.h), // ScreenUtil 적용
              // Center( // 이미지 컨테이너 제거
              //   child: AddImageContainer(
              //     onImageSelected: _handleImageSelected,
              //   ),
              // ),
              // SizedBox(height: 50.h), // 이미지와 이름 입력 필드 사이 간격 제거 또는 조정
              Center(
                child: SizedBox(
                  width: 900.w, // ScreenUtil 적용
                  // height 제거 (TextField 높이에 맞게 자동 조절)
                  child: TextField(
                    // Column 구조 단순화
                    onChanged: (text) {
                      vm.handleNameSelected(text);
                      print("입력된 텍스트: $text");
                    },
                    decoration: InputDecoration(
                      hintText: 'ex) 면접 만점 암기빵 맛집',
                      hintStyle: TextStyle(
                        color: const Color(0xFF8E95A2),
                        fontSize: 44.sp, // ScreenUtil 적용
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.44,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    maxLines: 1,
                    autocorrect: false,
                  ),
                ),
              ),
              SizedBox(height: 1250.h), // 이름 입력 필드와 버튼 사이 간격 조정 (이미지 제거 고려)
              Padding(
                padding: EdgeInsets.only(bottom: 200.h), // ScreenUtil 적용
                child: Center(
                  child: NextButton(
                    isEnabled: state.isNextButtonEnabled,
                    onTap:
                        state.isNextButtonClicked
                            ? () {}
                            : vm.handleNextButtonTap, // 처리 중일 때 탭 비활성화
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AddImageContainer 클래스 전체 제거
// class AddImageContainer extends StatefulWidget {
//   final Function(File?) onImageSelected; // 콜백 함수 추가

//   const AddImageContainer({super.key, required this.onImageSelected});

//   @override
//   _AddImageContainerState createState() => _AddImageContainerState();
// }

// class _AddImageContainerState extends State<AddImageContainer> {
//   File? _image;
//   final picker = ImagePicker();

//   Future getImage() async {
//     XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (file != null) {
//       File image = File(file.path);
//       setState(() {
//         _image = image;
//       });
//       widget.onImageSelected(image);
//       print("이미지 선택됨: ${image.path}"); // 이미지 경로 출력
//       print(image.path);
//     } else {
//       // Handle the case where no image was selected
//       print("No image selected.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: getImage,
//       child: Container(
//         width: 450.w,
//         height: 450.h,
//         decoration: BoxDecoration(
//           image:
//               _image != null
//                   ? DecorationImage(
//                     image: FileImage(_image!),
//                     fit: BoxFit.contain,
//                   )
//                   : DecorationImage(
//                     image: AssetImage('assets/images/add_image_circle.png'),
//                     fit: BoxFit.contain,
//                   ),
//         ),
//       ),
//     );
//   }
// }

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const NextButton({required this.isEnabled, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    // 버튼 텍스트 변경: isEnabled 상태에 따라 '다음' 또는 '만들기' 표시
    String buttonText = isEnabled ? '퀘스트 생성하기' : '다음';
    // isEnabled가 false (즉, 이름 입력 전)일 때는 '다음' 텍스트 표시
    // isEnabled가 true (즉, 이름 입력 후)일 때는 '만들기' 텍스트 표시

    Color bgColor =
        isEnabled ? Color(0xFFFF9F1C) : Colors.grey.shade300; // 비활성 상태 색상 변경
    Color textColor =
        isEnabled ? Colors.white : Colors.grey.shade600; // 비활성 상태 텍스트 색상 변경
    Color borderColor =
        isEnabled ? Colors.white : Colors.grey.shade300; // 비활성 상태 테두리 색상 변경

    return InkWell(
      // isEnabled가 false일 때 onTap 비활성화 (선택 사항, 버튼 모양만으로도 충분할 수 있음)
      onTap: isEnabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 993.w, // ScreenUtil 적용
        height: 160.h, // ScreenUtil 적용
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.75.w,
              color: borderColor,
            ), // ScreenUtil 적용
            borderRadius: BorderRadius.circular(33.r), // ScreenUtil 적용
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText, // 동적으로 변경된 텍스트 사용
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 50.sp, // ScreenUtil 적용
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.50,
          ),
        ),
      ),
    );
  }
}

import 'dart:convert'; // JSON 인코딩을 위해 유지
// import 'dart:io'; // File 사용 안 하므로 제거
import 'package:componentss/core/user_provider.dart';
// import 'package:componentss/features/study/data/group_model.dart'; // GroupModel 사용하지 않으므로 제거 (필요시 유지)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
// import 'package:image_picker/image_picker.dart'; // ImagePicker 사용 안 하므로 제거
// import 'package:path/path.dart' as path; // path 사용 안 하므로 제거
import 'package:http/http.dart' as http; // http는 그룹 업로드에 필요하므로 유지
// import 'package:http_parser/http_parser.dart'; // MediaType 사용 안 하므로 제거
import 'package:componentss/features/baking/UI/setting/study_comeplete_screen.dart';

import 'package:provider/provider.dart';

class StudyMakeGroupName extends StatefulWidget {
  const StudyMakeGroupName({super.key});

  @override
  State<StudyMakeGroupName> createState() => _StudyMakeGroupName();
}

class _StudyMakeGroupName extends State<StudyMakeGroupName> {
  // File? _selectedImage; // 이미지 관련 상태 제거
  String? _GroupName;
  bool _isNextButtonClicked = false;
  bool _isNextButtonEnabled = false;

  void _updateNextButtonState() {
    setState(() {
      // _GroupName 유효성만 검사
      _isNextButtonEnabled = _GroupName != null && _GroupName!.isNotEmpty;
    });
  }

  // void _handleImageSelected(File? image) { // 이미지 선택 핸들러 제거
  //   setState(() {
  //     _selectedImage = image;
  //     _updateNextButtonState();
  //   });
  // }

  void _handleNameSelected(String? text) {
    setState(() {
      _GroupName = text;
      _updateNextButtonState(); // 이름 변경 시 버튼 상태 업데이트
    });
  }

  /// 그룹 업로드 메서드
  Future<void> _uploadGroup(Map<String, dynamic> args) async {
    final String groupName = args['name'] ?? '그룹 이름 없음';

    var uri = Uri.parse("http://34.64.233.128:5200/groups"); // 🔥 엔드포인트 설정
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    final String category = args['category'] ?? "";
    final String category2 = args['category2'] ?? "";

    final List<String> tags = [category, category2];
    var request =
        http.MultipartRequest("POST", uri)
          ..fields['authorId'] =
              user!.id! // userProvider에서 가져온 ID 사용
          ..fields['name'] = groupName
          ..fields['tags'] = jsonEncode(tags); // JSON 문자열 형태

    // if (imageFile != null) { // 이미지 파일 업로드 로직 제거
    //   request.files.add(
    //     await http.MultipartFile.fromPath(
    //       "image",
    //       imageFile.path,
    //       filename: path.basename(imageFile.path),
    //       contentType: MediaType('image', 'jpeg'),
    //     ),
    //   );
    // }

    // 이미지 없이 필드만 전송
    try {
      var response = await request.send(); // 🚀 요청 전송
      print("요청전송 (이미지 없음)");
      var responseBody = await response.stream.bytesToString(); // 응답 읽기
      print("응답 상태 코드: ${response.statusCode}");
      print("응답 본문: $responseBody");
      // 성공/실패 처리 로직 추가 가능
    } catch (e) {
      print("그룹 업로드 중 오류 발생: $e");
      // 사용자에게 오류 알림 등 예외 처리
    }
  }

  void _handleNextButtonTap() async {
    // 버튼 클릭 가능 상태이고, 아직 처리 중이 아닐 때만 실행
    if (_isNextButtonEnabled && !_isNextButtonClicked) {
      setState(() {
        _isNextButtonClicked = true; // 처리 시작 표시
      });

      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
          {}; // null 체크 및 기본값 추가
      final String category = args['category'] ?? ""; // 기본값 설정
      final String category2 = args['category2'] ?? ""; // 기본값 설정
      final String date = args['date'] ?? ""; // 기본값 설정
      final String time = args['time'] ?? ""; // 기본값 설정
      final String studyLevel = args['studyLevel'] ?? ""; // 기본값 설정
      final String inclusionOption = args['inclusionOption'] ?? ""; // 기본값 설정
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      // 그룹 업로드에 필요한 인자만 전달
      Map<String, dynamic> uploadArgs = {
        'name': _GroupName,
        // 'imagePath': _selectedImage?.path, // 이미지 경로 제거
        'authorId': user!.id!, // UserProvider에서 가져온 ID 사용 (null 가능성 처리)
        'category': category,
        'category2': category2,
        // "tags": ["tag1", "tag2"], // 실제 태그 사용하도록 수정
      };

      // authorId가 null이면 업로드 시도하지 않음 (예외 처리)
      if (uploadArgs['authorId'] == null) {
        print("사용자 ID를 찾을 수 없어 그룹을 업로드할 수 없습니다.");
        setState(() {
          _isNextButtonClicked = false; // 처리 완료 (실패)
        });
        // 사용자에게 오류 메시지 표시 등 추가 처리 가능
        return;
      }

      await _uploadGroup(uploadArgs); // 그룹 업로드 메서드 호출

      // 다음 화면으로 이동 (이미지 경로 제거)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudyComplete(),
          settings: RouteSettings(
            arguments: {
              'category': category,
              'category2': category2,
              'date': date,
              'time': time,
              'studyLevel': studyLevel,
              'inclusionOption': inclusionOption,
              'groupName': _GroupName,
              // 'imagePath': _selectedImage?.path, // 이미지 경로 제거
            },
          ),
        ),
      ).then((_) {
        // StudyMakeGroupComplete 화면에서 돌아왔을 때 실행될 로직
        if (mounted) {
          setState(() {
            _isNextButtonClicked = false; // 버튼 상태 초기화
          });
        }
      });
    } else if (!_isNextButtonEnabled) {
      print("그룹 이름을 입력해주세요."); // 사용자에게 안내 메시지
    } else {
      print("이미 처리 중입니다."); // 중복 클릭 방지
    }
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
                      _handleNameSelected(text);
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
              SizedBox(height: 1000.h), // 이름 입력 필드와 버튼 사이 간격 조정 (이미지 제거 고려)
              Padding(
                padding: EdgeInsets.only(bottom: 200.h), // ScreenUtil 적용
                child: Center(
                  child: NextButton(
                    isEnabled: _isNextButtonEnabled,
                    onTap:
                        _isNextButtonClicked
                            ? () {}
                            : _handleNextButtonTap, // 처리 중일 때 탭 비활성화
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

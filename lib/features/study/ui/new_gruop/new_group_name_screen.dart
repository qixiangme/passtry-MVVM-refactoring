import 'dart:convert';
import 'dart:io';
import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/ui/new_gruop/new_group_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import 'package:componentss/features/study/ui/new_gruop/new_group_complete_screen.dart';

class NewGroupNameScreen extends StatefulWidget {
  const NewGroupNameScreen({super.key});

  @override
  State<NewGroupNameScreen> createState() => _NewGroupNameScreen();
}

class _NewGroupNameScreen extends State<NewGroupNameScreen> {
  File? _selectedImage;
  String? _GroupName;
  bool _isNextButtonClicked = false;
  bool _isNextButtonEnabled = false;

  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled =
          _isNextButtonEnabled = _GroupName != null && _GroupName!.isNotEmpty;
    });
  }

  void _handleImageSelected(File? image) {
    setState(() {
      _selectedImage = image;
      _updateNextButtonState();
    });
  }

  void _handleNameSelected(String? text) {
    setState(() {
      _GroupName = text;
      _updateNextButtonState();
    });
  }

  /// 그룹 업로드 메서드
  Future<void> _uploadGroup(Map<String, dynamic> args) async {
    final String groupName = args['name'] ?? '그룹 이름 없음';
    final String? imagePath = args['imagePath'] as String?;
    final File? imageFile = imagePath != null ? File(imagePath) : null;

    var uri = Uri.parse("http://34.64.233.128:5200/groups"); // 🔥 엔드포인트 설정
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    final String category = args['category'] ?? "";

    final List<String> tags = [category];
    var request =
    http.MultipartRequest("POST", uri)
      ..fields['authorId'] = user!.email
      ..fields['name'] = groupName
      ..fields['tags'] = jsonEncode(tags); // JSON 문자열 형태

    if (imageFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          "image",
          imageFile.path,
          filename: path.basename(imageFile.path),
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      user.joinedGroups = [
        ...user.joinedGroups,
        GroupModel(
          id: '00', // 수정 필요
          authorId: user.id!, // user.id가 null이 아님을 가정하고 '!'로 null safety 처리
          name: groupName,
          joinCode: '00', // 수정 필요
          tags: tags,
          imageUrl: imagePath,
          memberIds: [user.id!], // 그룹 생성자는 초기 멤버로 포함
          score: 0, // 초기 점수 설정 (적절한 값으로 변경 가능)
          level: 1, // 초기 레벨 설정 (적절한 값으로 변경 가능)
        ),
      ];

      try {
        var response = await request.send(); // 🚀 요청 전송
        print("요청전송");
        var responseBody = await response.stream.bytesToString(); // 응답 읽기
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  void _handleNextButtonTap() async {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String category = args['category'];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    await _uploadGroup({
      'name': _GroupName,
      'imagePath': _selectedImage?.path,
      'authorId': user!.email,
      "tags": ["tag1", "tag2"],
    });

    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)
    if (_isNextButtonEnabled) {
      setState(() {
        _isNextButtonClicked = true;
      });

      await _uploadGroup(args); // 그룹 업로드 메서드 호출

      // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewGroupCompleteScreen(),
          settings: RouteSettings(
            arguments: {
              'category': category,
              'groupName': _GroupName,
              'imagePath': _selectedImage?.path,
            },
          ),
        ),
      ).then((_) {
        // StudyMakeGroup2 에서 돌아온 후에 이 코드가 실행됨
        // 위젯이 화면에 아직 마운트되어 있는지 확인 (중요)
        if (mounted) {
          // 3. 버튼 상태를 다시 false로 초기화
          setState(() {
            _isNextButtonClicked = false;
          });
        }
      });
    } else {
      print("다음 버튼 클릭 불가");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                                        _handleNameSelected(text);
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
                                            Colors
                                                .grey
                                                .shade200, // 테두리 색상 설정
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
                  SizedBox(height: 680.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 200.h),
                    child: Center(
                      child: NextButton(
                        isEnabled: _isNextButtonEnabled,
                        onTap: _handleNextButtonTap,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const NextButton({required this.isEnabled, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = isEnabled ? Color(0xFFFF9F1C) : Colors.white;
    Color borderColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);
    Color textColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 993.w,
        height: 160.h,
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          isEnabled ? '만들기' : '다음',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 50.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.50,
          ),
        ),
      ),
    );
  }
}

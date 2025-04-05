import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/ui/study_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchGroupScreen extends StatefulWidget {
  const SearchGroupScreen({super.key});

  @override
  State<SearchGroupScreen> createState() => _SearchGroupScreenState();
}

class _SearchGroupScreenState extends State<SearchGroupScreen> {
  GroupApi groupApi = GroupApi();
  bool _isButtonEnabled = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> digits = List.filled(4, ""); // 숫자를 저장하는 리스트

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length == 4) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final userId = user?.email ?? "unknown";
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
        padding: const EdgeInsets.only(left: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "찾고 있는 빵집 주소 네 자리를\n입력해주세요",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 70),

            // 네모 박스 (클릭하면 키보드 열림)
            Padding(
              padding: EdgeInsets.only(left: 1),
              child: GestureDetector(
                onTap: () => _focusNode.requestFocus(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 87,
                      height: 87,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffC4CAD4)),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        digits[index], // 입력된 숫자 표시
                        style: const TextStyle(
                          color: Color(0xff6B6B6B),
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // 숨겨진 텍스트필드 (숫자 입력 감지)
            Opacity(
              opacity: 0, // 안 보이게 설정
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  setState(() {
                    digits = List.generate(
                      4,
                          (index) => index < text.length ? text[index] : "",
                    );
                    print("digits: $digits");
                  });
                },
              ),
            ),
            SizedBox(height: 400),
            Padding(
              padding: EdgeInsets.only(right: 18),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_isButtonEnabled) {
                      // 검색하기 버튼 클릭 시
                      String groupCode = digits.join();
                      groupApi.joinGroup(groupCode, userId);

                      GroupModel? group = await groupApi.getGroupByJoinCode(
                        groupCode,
                      );

                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.all(
                                Radius.circular(38.5.r),
                              ),
                            ),

                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(height: 60),

                                if (group?.imageUrl !=
                                    null) // 이미지 URL이 존재하는 경우만 표시
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ), // 이미지 둥근 모서리
                                    child: Image.network(
                                      group!.imageUrl!,
                                      height: 200, // 이미지 높이
                                      width: 200, // 이미지 너비
                                      fit: BoxFit.cover, // 이미지 크기 조정
                                      errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                          ) {
                                        return Icon(
                                          Icons.broken_image,
                                          size: 100,
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                Center(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: group?.name,
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "을",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "찾고 계셨군요!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 479.w,
                                        height: 160.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xFFFF9F1C),
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(33.r),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "다시 입력하기",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFF9F1C),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                MainScreen(goToPage: 1),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 479.w,
                                        height: 160.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF9F1C),
                                          border: Border.all(
                                            color: Color(0xFFFF9F1C),
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(33.r),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "참여하기",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),

                    width: 991.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      color:
                      _isButtonEnabled ? Color(0XFFFF9F1C) : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                      border: Border.all(color: Color(0XFFFF9F1C)),
                    ),
                    child: Center(
                      child: Text(
                        _isButtonEnabled ? "다음" : "검색하기",
                        style: TextStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.w600,
                          color:
                          _isButtonEnabled
                              ? Colors.white
                              : Color(0XFFFF9F1C),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

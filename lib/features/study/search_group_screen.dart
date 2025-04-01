import 'package:componentss/features/main_screen.dart';
import 'package:componentss/features/study/study_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchGroupScreen extends StatefulWidget {
  const SearchGroupScreen({super.key});

  @override
  State<SearchGroupScreen> createState() => _SearchGroupScreenState();
}

class _SearchGroupScreenState extends State<SearchGroupScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text("찾고 있는 빵집 주소 네자리를"),
            const Text("입력해주세요"),
            const SizedBox(height: 20),

            // 네모 박스 (클릭하면 키보드 열림)
            GestureDetector(
              onTap: () => _focusNode.requestFocus(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      digits[index], // 입력된 숫자 표시
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
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
            SizedBox(height: 480),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_isButtonEnabled) {
                    // 검색하기 버튼 클릭 시
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
                              SizedBox(height: 300),
                              Center(child: Text("면접 만점 암기빵 맛집을")),
                              Center(child: Text("찾고 계셨군요!")),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
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
                                          color: Color(0xFFFF9F1C),
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
                                          style: TextStyle(color: Colors.white),
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
                child: Container(
                  width: 991.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: _isButtonEnabled ? Color(0XFFFF9F1C) : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                    border: Border.all(color: Color(0XFFFF9F1C)),
                  ),
                  child: Center(
                    child: Text(
                      "검색하기",
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w600,
                        color:
                            _isButtonEnabled ? Colors.white : Color(0XFFFF9F1C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

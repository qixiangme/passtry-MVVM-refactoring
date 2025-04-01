import 'package:componentss/features/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

//UI 작업할때 신경 안써도 되는 부분~

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _nameError;
  String? _idError;
  String? _passwordError;
  String? _confirmPasswordError;
  bool _isButtonEnabled = false;
  void _checkFormFilled() {
    setState(() {
      _isButtonEnabled =
          _nameController.text.isNotEmpty &&
          _idController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkFormFilled);
    _idController.addListener(_checkFormFilled);
    _passwordController.addListener(_checkFormFilled);
    _confirmPasswordController.addListener(_checkFormFilled);
  }

  void _validateInputs() {
    setState(() {
      _nameError = _validateName(_nameController.text);
      _idError = _validateId(_idController.text);
      _passwordError = _validatePassword(_passwordController.text);
      _confirmPasswordError = _validateConfirmPassword(
        _confirmPasswordController.text,
      );
    });

    if (_nameError == null &&
        _idError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("회원가입 성공!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }

  String? _validateName(String value) {
    if (value.isEmpty) return "이름을 입력해주세요.";
    if (!RegExp(r"^[가-힣]+$").hasMatch(value)) return "한글만 입력 가능합니다.";
    return null;
  }

  String? _validateId(String value) {
    if (value.isEmpty) return "아이디를 입력해주세요.";
    if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) return "영문과 숫자만 입력 가능합니다.";
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) return "비밀번호를 입력해주세요.";
    if (value.length < 8) return "비밀번호는 8자리 이상이어야 합니다.";
    if (!RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$").hasMatch(value)) {
      return "영문 + 숫자 조합이어야 합니다.";
    }
    return null;
  }

  String? _validateConfirmPassword(String value) {
    if (value.isEmpty) return "비밀번호를 다시 입력해주세요.";
    if (value != _passwordController.text) return "비밀번호가 일치하지 않습니다.";
    return null;
  }

  //~ UI 작업할때 신경 안써도 되는 부분

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "회원가입",
                style: TextStyle(fontSize: 76.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),
              _buildInputField("이름", "한글만 입력", _nameController, _nameError),
              SizedBox(height: 30),
              _buildInputField("아이디", "영문, 숫자 조합", _idController, _idError),
              SizedBox(height: 30),
              _buildInputField(
                "비밀번호",
                "영문, 숫자 조합 8자리 이상",
                _passwordController,
                _passwordError,
                obscureText: true,
              ),
              SizedBox(height: 10),
              _buildInputField(
                "비밀번호 재입력",
                "비밀번호 재입력",
                _confirmPasswordController,
                _confirmPasswordError,
                obscureText: true,
              ),
              SizedBox(height: 100),
              Center(
                child: GestureDetector(
                  onTap: _validateInputs,
                  child: Container(
                    width: 991.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      color:
                          _isButtonEnabled ? Color(0XFFFF9F1C) : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                      border: Border.all(color: Color(0XFFFF9F1C)),
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          "다음",
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //텍스트쓰는 동그란 네모 위젯 공통 설정
  Widget _buildInputField(
    String label,
    String hint,
    TextEditingController controller,
    String? error, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            if (error != null)
              Text(error, style: TextStyle(color: Colors.red, fontSize: 30.sp)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: 991.w,
          height: 119.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
            border: Border.all(color: Color(0xFFC4CAD4)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Color(0xFFC4CAD4)),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

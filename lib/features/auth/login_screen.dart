import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/auth/data/auth_api.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _login(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final email = _idController.text;
    final password = _passwordController.text;

    final success = await AuthApi.loginUser(context, email, password);

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인 성공!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(goToPage: 1)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인 실패")));
    }
  }

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: Text(
              "로그인",
              style: TextStyle(fontSize: 76.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "닉네임",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),

          Center(
            child: Container(
              width: 991.w,
              height: 119.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                border: Border.all(color: Color(0xFFC4CAD4)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    hintText: "닉네임을 입력하세요",
                    hintStyle: TextStyle(color: Color(0xFFC4CAD4)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "비밀번호",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 991.w,
              height: 119.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                border: Border.all(color: Color(0xFFC4CAD4)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "영문, 숫자, 특수문자 조합 8자리 이상",
                    hintStyle: TextStyle(color: Color(0xFFC4CAD4)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () => _login(context), //
            child: Center(
              child: Container(
                width: 991.w,
                height: 160.h,
                decoration: BoxDecoration(
                  color: Color(0XFFFF9F1C),
                  borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                ),
                child: Center(
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '아이디 찾기',
                style: TextStyle(
                  color: const Color(0xFF6B6B6B) /* dark-gray */,
                  fontSize: 40.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'ㅣ',
                style: TextStyle(
                  color: const Color(0xFF6B6B6B) /* dark-gray */,
                  fontSize: 40.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '비밀번호 찾기',
                style: TextStyle(
                  color: const Color(0xFF6B6B6B) /* dark-gray */,
                  fontSize: 40.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

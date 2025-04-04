import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/auth/onboarding_screen.dart';
import 'package:componentss/features/baking/questions/odd/odd_quiz.dart';
import 'package:componentss/features/baking/questions/odd/odd_screen.dart';
import 'package:componentss/features/baking/questions/trend/trend_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/features/baking/questions/trend/trend_ox.dart';
import 'package:componentss/features/baking/questions/trend/trend_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ), // UserProvider 등록
      ],
      child: Builder(
        builder: (context) {
          // ScreenUtil 초기화
          ScreenUtil.init(context, designSize: Size(1080, 2400));
          return MaterialApp(
            home: OnboardingScreen(),
            theme: ThemeData(
              fontFamily: "Wanted Sans",
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

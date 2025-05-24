import 'package:componentss/features/baking/view/baking_screen.dart';
import 'package:componentss/features/study/view/study_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ✅ Riverpod

import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/search/view/search_screen_view.dart';

void main() {
  runApp(
    ProviderScope(
      // ✅ Riverpod 사용 가능하게 감싸기
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ScreenUtil.init(context, designSize: const Size(1080, 2400));
        return MaterialApp(
          locale: const Locale('ko', 'KR'),
          home: BakingScreen(),
          theme: ThemeData(
            fontFamily: "Wanted Sans",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(color: Colors.white),
          ),
        );
      },
    );
  }
}

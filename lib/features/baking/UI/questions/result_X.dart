import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
class resultScreen extends StatefulWidget {
  const resultScreen({super.key});

  @override
  _resultScreenState createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          centerTitle: false,
          leading: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 24.96194076538086,
        left: -21,
        child: Transform.rotate(
        angle: 45 * (math.pi / 180),
        child: Image.asset(
        'C:/Users/USER/Desktop/2025_TEAM_9_FE/assets/icons/plus.png',
        color: const Color(0xFF6B6B6B)
      ),
      )
      ),
        ]
      )
    )
          
        ),
      ),
      body: Container(
        decoration : BoxDecoration(color: const Color(0xFFFFFFFF)),
        width: 1080.w,
        height: 2400.h,
        child: Column(
          children: [
            Positioned(
              top: 340.63.h,
              left: 45.w,
              child: Text(
              '아쉽지만,\n한번 더 도전해볼까요? 🍞',
              style: TextStyle(fontSize: 76.sp, color: Colors.black),
            )
            ),
            Positioned(
              top: 496.h,
              left: 44.5.w,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '오늘의 퀘스트는 놓쳤지만, 실패도 성장의 한 과정이에요.\n내일 다시 도전해서 더 맛있는 결과를 만들어봐요!'
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              top: 2032.h,
              left: 44.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
            topLeft: Radius.circular(33),
            topRight: Radius.circular(33),
            bottomLeft: Radius.circular(33),
            bottomRight: Radius.circular(33),
          ),
                  color: const Color(0xFFFF9F1C) /* main-orange */,
                ),
      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 44),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('다음 퀘스트 도전하기', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Wanted Sans',
        fontSize: 50,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
)
              )
            
          ]
        )
      ),
    ),
        Positioned(
      top: 791.h,
      left: 44.w,
      child: Container(
        width: 992,
        height: 1092,
        decoration: BoxDecoration(
          color : Color(0xFFECECEC)
    )
  )
      )
    ]
        ),
      )
    );



  }
}
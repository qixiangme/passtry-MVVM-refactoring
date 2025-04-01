import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupLevel extends StatefulWidget {
  const StudyMakeGroupLevel({super.key});

  @override
  State<StudyMakeGroupLevel> createState() => _StudyMakeGroupLevelState();
}

class _StudyMakeGroupLevelState extends State<StudyMakeGroupLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 150.h)],

        ),
      ),
    );
  }
}

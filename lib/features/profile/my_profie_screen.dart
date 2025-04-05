import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:componentss/core/user_provider.dart';

class MyProfieScreen extends StatelessWidget {
  const MyProfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    if (user != null) {
      print("사용자 이름: ${user.username}");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 200.h,
        title: Text(
          '마이페이지',
          style: TextStyle(
            color: const Color(0xFF1C1C1C),
            fontSize: 60.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w700,
            letterSpacing: -0.60.w,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              icon: Icon(Icons.settings, size: 66.w, color: Colors.grey),
              onPressed: () {},
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 245.w,
                    height: 245.h,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: NetworkImage("https://placehold.co/245x245"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 2.75.w,
                          color: const Color(0xFFC4CAD4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user != null ? user.username : "username",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50.sp,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          _buildProfileBadge(
                            text: 'level',
                            color: const Color(0xFFFF9F1C),
                            backgroundColor: const Color(0x21FF9F1C),
                          ),
                          SizedBox(width: 20.w),
                          _buildProfileBadge(
                            text: '1234 P',
                            color: const Color(0xFFFF9F1C),
                            backgroundColor: const Color(0x21FF9F1C),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              _buildInfoCard(
                iconData: Icons.flag,
                title: '목표',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTag('#교내동아리'),
                    SizedBox(width: 15.w),
                    _buildTag('#학술'),
                  ],
                ),
                onTap: () {
                  print("목표 탭");
                },
              ),
              SizedBox(height: 25.h),
              _buildInfoCard(
                iconData: Icons.edit_note,
                title: '내가 작성한 예상 답안',
                trailing: Text(
                  '20',
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B),
                    fontSize: 50.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  print("예상 답안 탭");
                },
              ),
              SizedBox(height: 25.h),
              _buildInfoCard(
                iconData: Icons.bakery_dining,
                title: '완성한 빵 레시피',
                trailing: Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B),
                    fontSize: 50.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  print("빵 레시피 탭");
                },
              ),
              SizedBox(height: 50.h),
              Container(
                color: const Color(0xFFEBEBEB).withOpacity(0.20),
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 30.h),
                child: Column(
                  children: [
                    _buildSettingsItem('공지사항', onTap: () { print("공지사항"); }),
                    _buildSettingsItem('FAQ', onTap: () { print("FAQ"); }),
                    _buildSettingsItem('약관 및 정책', onTap: () { print("약관 및 정책"); }),
                    _buildSettingsItem(
                      '버전 정보',
                      trailingText: '1.0.0',
                      showArrow: false,
                      onTap: () { print("버전 정보"); },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBadge({
    required String text,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: color),
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: 36.sp,
          fontFamily: 'Wanted Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData iconData,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 151.h,
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: const Color(0xFFC4CAD4)),
            borderRadius: BorderRadius.circular(38.50.r),
          ),
        ),
        child: Row(
          children: [
            Icon(iconData, size: 80.w, color: Colors.grey[700]),
            SizedBox(width: 30.w),
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF1C1C1C),
                fontSize: 40.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            trailing,
            SizedBox(width: 20.w),
            Icon(Icons.arrow_forward_ios, size: 32.w, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, {
    String? trailingText,
    bool showArrow = true,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35.h),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF6B6B6B),
                fontSize: 40.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (trailingText != null)
              Padding(
                padding: EdgeInsets.only(right: showArrow ? 15.w : 0),
                child: Text(
                  trailingText,
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B),
                    fontSize: 40.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, size: 32.w, color: Colors.grey),
          ],
        ),
      ),
    );
  }


  Widget _buildTag(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF6B6B6B),
        fontSize: 40.sp,
        fontFamily: 'Wanted Sans',
        fontWeight: FontWeight.w500,
        height: 1.05,
        letterSpacing: -0.40.w,
      ),
    );
  }
}
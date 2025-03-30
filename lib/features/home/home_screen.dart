import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Layout Example',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 159, 28),
          ),
          home: child,
        );
      },
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        ListView(children: [Rectangle1()]),

        ],
      ),
    );
  }
}

class Rectangle1 extends StatefulWidget {
  @override
  _Rectangle1State createState() => _Rectangle1State();
}

class _Rectangle1State extends State<Rectangle1> {
  int _currentPage = 0;
  final PageController _pageController = PageController(); // PageController 추가
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Padding(
      padding: EdgeInsets.all(44.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '진행 중인 퀘스트',
            style: TextStyle(
              color: const Color(0xFF353C49),
              fontSize: 44.sp,
              fontFamily: 'Wanted Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.44.w,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(38.5.r),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(38.5.r),
            ),
          ),
          SizedBox(height: 100.h),
          Text(
            '‘면접 만점 암기빵’에서 나의 순위는?',
            style: TextStyle(
              color: const Color(0xFF353C49),
              fontSize: 44.sp,
              fontFamily: 'Wanted Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.44.w,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSmallPlaceholder(),
              _buildSmallPlaceholder(),
              _buildSmallPlaceholder(),
            ],
          ),
          SizedBox(height: 100.h),
          Text(
            '추천 동아리 • 기업 모집 공고',
            style: TextStyle(
              color: const Color(0xFF353C49),
              fontSize: 44.sp,
              fontFamily: 'Wanted Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.44.w,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 500.h,
            child: PageView.builder(
              controller: _pageController, // PageController 연결
              itemCount: 3,
              onPageChanged: (int page) {
                // 페이지 변경 시 상태 업데이트
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(38.5.r),
                  ),
                  child: Center(child: Text('페이지 ${index + 1}')),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          _buildPaginationDots(),
          SizedBox(height: 100.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '패스츄리 이용이 처음이라면?',
                      style: TextStyle(
                        color: const Color(0xFFFF9F1C),
                        fontSize: 33.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '이용 가이드 살펴보기',
                      style: TextStyle(
                        color: const Color(0xFF1F1F1F),
                        fontSize: 44.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 35.75.w),
              Row(
                children: [
                  Container(
                    width: 38.50.w,
                    height: 38.50.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9F1C),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.50.sp,
                    color: const Color(0xFF1F1F1F),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ))
    ;
  }

  Widget _buildSmallPlaceholder() {
    return Container(
      width: 310.w,
      height: 350.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(38.5.r),
      ),
    );
  }

  Widget _buildPaginationDots() {
    int totalPages = 3; // 페이지 수


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 11.w),
          width: 16.50.w,
          height: 16.50.h,
          decoration: ShapeDecoration(
            color:
                index == _currentPage
                    ? const Color(0xFF1C1C1C)
                    : const Color(0xFFC4CAD4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.25.r),
            ),
          ),
        );
      }),
    );
  }
}

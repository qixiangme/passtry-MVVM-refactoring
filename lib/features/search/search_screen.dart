import 'package:componentss/features/search/post_screen.dart';
import 'package:componentss/features/search/search_bar_screen.dart';
import 'package:componentss/features/search/upload_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 300,
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              children: [
                Container(
                  width: 1080.w,
                  height: 300.h,
                  padding: EdgeInsets.only(top: (200.75).h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 815.50.w,
                        child: Text(
                          '탐색',
                          style: TextStyle(
                            color: const Color(0xFF1C1C1C) /* main-black */,
                            fontSize: 60.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UploadPostScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 500.h,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: PageController(
                      viewportFraction: 1,
                    ), // 가로 스크롤 설정
                    children: [
                      Container(
                        height: 389.h,
                        margin: EdgeInsets.only(right: 16.w), // 각 항목 간의 간격
                        decoration: BoxDecoration(
                          color: Color(0xffFF9F1C),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      Container(
                        height: 389.h,
                        width: 993.w,
                        margin: EdgeInsets.only(right: 16.w), // 각 항목 간의 간격
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                        ),
                      ),
                      Container(
                        height: 389.h,
                        width: 993.w,
                        margin: EdgeInsets.only(right: 16.w), // 각 항목 간의 간격
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(pinned: true, delegate: _SearchBar()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 200.h, // 가로 리스트 높이 지정
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // 가로 스크롤
                    child: Row(
                      children: List.generate(10, (index) {
                        return Container(
                          width: 150.w,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostScreen()),
                    );
                  },
                  child: Container(
                    height: 300.h, // 아이템 높이
                    margin: EdgeInsets.symmetric(vertical: 10.h), // 아이템 사이 간격
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey), // 경계선 색과 두께 지정
                    ),
                  ),
                );
              },
              childCount: 10, // 리스트 아이템 개수
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60.0; // 최소 크기
  @override
  double get maxExtent => 80.0; // 최대 크기

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchBarScreen()),
        );
      },
      child: Container(
        color: Colors.grey,
        child: SizedBox(
          child: Center(
            child: Text(
              '모집 중인 스터디, 공고 검색하기',
              style: TextStyle(
                color: const Color(0xFF6B6B6B) /* dark-gray */,
                fontSize: 36.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.36,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

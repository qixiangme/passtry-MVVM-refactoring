import 'package:componentss/features/search/post_screen.dart';
import 'package:componentss/features/search/search_bar_screen.dart';
import 'package:componentss/features/search/upload_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTagIndex = 0;
  int currentCardIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 340,
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              children: [
                Container(
                  width: 1080.w,
                  height: 275.h,
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
                            fontWeight: FontWeight.w800,
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

                Row(
                  children: [
                    SizedBox(width: 20),
                    SizedBox(
                      width: 993.w,
                      height: 360.h,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: ((index) {
                          setState(() {
                            currentCardIndex = index;
                          });
                        }),
                        children: List.generate(
                          4,
                          (index) => Container(
                            height: 389.h,
                            width: 993.w,
                            margin: EdgeInsets.only(right: 30.w),
                            decoration: BoxDecoration(
                              color: Color(0xffFF9F1C),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            currentCardIndex == index
                                ? Colors
                                    .black // 활성화된 페이지는 주황색
                                : Color(0xffD9D9D9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 3)),
          SliverPersistentHeader(pinned: true, delegate: _SearchBar()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 14),
                SizedBox(
                  height: 95.h, // 가로 리스트 높이 지정
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // 가로 스크롤
                    child: Row(
                      children: List.generate(7, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTagIndex = index;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 190.w,
                                height: 100.h,
                                decoration: ShapeDecoration(
                                  color:
                                      selectedTagIndex == index
                                          ? Color(0x21FF9F1C) // 주황색
                                          : Colors.white, // 회색
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.75.w, // 화면 밀도 적용
                                      color:
                                          selectedTagIndex == index
                                              ? Color(0xFFFF9F1C) // 주황색
                                              : Color(0xFFECECEC), // 회색
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      36.r,
                                    ), // 화면 밀도 적용
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '🔠',
                                      style: TextStyle(
                                        color:
                                            selectedTagIndex == index
                                                ? Color(0xFF1C1C1C)
                                                : Color(0xFF6B6B6B),
                                        fontSize: 36.sp, // 화면 밀도 적용
                                        fontFamily: 'Wanted Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '어학',
                                      style: TextStyle(
                                        color:
                                            selectedTagIndex == index
                                                ? Color(0xFF1C1C1C)
                                                : Color(0xFF6B6B6B),
                                        fontSize: 36.sp, // 화면 밀도 적용
                                        fontFamily: 'Wanted Sans',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
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
                    height: 380.h, // 아이템 높이
                    margin: EdgeInsets.symmetric(vertical: 20.h), // 아이템 사이 간격
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: Color(0xffECECEC),
                      ), // 경계선 색과 두께 지정
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
  double get minExtent => 40.0; // 최소 크기
  @override
  double get maxExtent => 40.00; // 최대 크기

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
        margin: EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(22), // 둥글게 설정
        ),
        child: SizedBox(
          child: Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 23),
                child: Text(
                  '모집 중인 스터디, 공고 검색하기',
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B) /* dark-gray */,
                    fontSize: 29.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.36,
                  ),
                ),
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

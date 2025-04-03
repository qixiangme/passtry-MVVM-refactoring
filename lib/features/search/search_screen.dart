import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/search_api.dart';
import 'package:componentss/features/search/data/sort_api.dart';
import 'package:componentss/features/search/post_screen.dart';
import 'package:componentss/features/search/search_bar_screen.dart';
import 'package:componentss/features/search/upload_post_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SortApi sortApi = SortApi();
  bool isLoading = false;
  List<PostModel> posts = [];
  bool isFetchingMore = false;
  int selectedTagIndex = 0;
  int currentPage = 1;
  final List<String> tagNames = [
    "popular",
    "recent",
    "major",
    "academic",
    "art",
    "hobby",
    "volunteer",
    "language",
    "startup",
    "travel",
  ];
  int currentCardIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 1);
  final ScrollController _scrollController = ScrollController();
  void onTagSelected(int index) async {
    setState(() {
      selectedTagIndex = index;
    });

    try {
      List<PostModel> sortedPosts = await sortApi.sortPosts(
        sort: tagNames[index],
      );
      print(sortedPosts);
      setState(() {
        posts = sortedPosts;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    onTagSelected(0);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  void _onScroll() {
    // if (_scrollController.position.pixels >=
    //         _scrollController.position.maxScrollExtent - 100 &&
    //     !isFetchingMore &&
    //     !isLoading) {
    //   _fetchMorePosts(); // 추가 데이터 로드
    // }
  }

  Future<void> _fetchMorePosts() async {
    setState(() {
      isFetchingMore = true;
    });

    try {
      currentPage++; // 다음 페이지
      List<PostModel> morePosts = await sortApi.sortPosts();
      setState(() {
        posts.addAll(morePosts); // 기존 데이터에 추가
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isFetchingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 310,
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              children: [
                Container(
                  width: 1080.w,
                  height: 265.h,
                  padding: EdgeInsets.only(top: (60.75).h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 815.50.w,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
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
                      ),
                      SizedBox(width: 33),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UploadPostScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          CustomIcon.add,
                          size: 27,
                          color: Color(0xff1C1C1C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),

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

          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBar(
              selectedTagIndex: selectedTagIndex,
              onTagSelected: onTagSelected,
            ),
          ),
          SliverToBoxAdapter(child: Column(children: [SizedBox(height: 10)])),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(post: posts[index]),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 992.w,
                      height: 290.h, // 아이템 높이
                      margin: EdgeInsets.symmetric(vertical: 20.h), // 아이템 사이 간격
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Color(0xffECECEC),
                        ), // 경계선 색과 두께 지정
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 700.w,
                            child: Column(
                              spacing: 32.r,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15, top: 15),
                                  child: Text(
                                    posts[index].title,
                                    style: TextStyle(
                                      letterSpacing: -0.44,
                                      fontSize: 44.sp,
                                      fontFamily: "Wanted Sans",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    posts[index].content,
                                    style: TextStyle(
                                      color: const Color(
                                        0xFF6B6B6B,
                                      ) /* dark-gray */,
                                      fontSize: 35.sp,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 3),
                          posts[index].imageUrl != null
                              ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Image.network(
                                  posts[index].imageUrl!,
                                  width: 168.w,
                                  height: 168.h,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: posts.length, // 리스트 아이템 개수
            ),
          ),
          SliverToBoxAdapter(
            child:
                isFetchingMore
                    ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(child: CircularProgressIndicator()),
                    )
                    : Container(),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends SliverPersistentHeaderDelegate {
  final int selectedTagIndex;
  final Function(int) onTagSelected;
  Map<int, Map<String, String>> categoryDict = {
    0: {'icon': '🔥', 'text': '인기'},
    1: {'icon': '⏱️', 'text': '최근'},
    2: {'icon': '💻', 'text': '전공'},
    3: {'icon': '📚', 'text': '학술'},
    4: {'icon': '🎨', 'text': '예술'},
    5: {'icon': '👥', 'text': '취미'},
    6: {'icon': '☀️', 'text': '봉사'},
    7: {'icon': '🔠', 'text': '어학'},
    8: {'icon': '🤝', 'text': '창업'},
    9: {'icon': '✈️', 'text': '여행'},
  };

  _SearchBar({required this.selectedTagIndex, required this.onTagSelected});
  @override
  double get minExtent => 95.0; // 최소 크기
  @override
  double get maxExtent => 95.00; // 최대 크기

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchBarScreen()),
            );
          },
          child: Container(
            height: 122.h,
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
                    child: Row(
                      children: [
                        Text(
                          '모집 중인 스터디, 공고 검색하기',
                          style: TextStyle(
                            color: const Color(0xFF6B6B6B) /* dark-gray */,
                            fontSize: 34.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.36,
                          ),
                        ),
                        SizedBox(width: 157),
                        Icon(
                          CustomIcon.search,
                          color: Color(0XFF6B6B6B),
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 95.h, // 가로 리스트 높이 지정
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // 가로 스크롤
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: List.generate(9, (index) {
                  return GestureDetector(
                    onTap: () => onTagSelected(index),
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
                                categoryDict[index]!["icon"]!,
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
                                categoryDict[index]!["text"]!,
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
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

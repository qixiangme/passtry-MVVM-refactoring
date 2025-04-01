import 'dart:convert';
import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/sort_api.dart';
import 'package:componentss/features/search/post_screen.dart';
import 'package:componentss/features/search/search_bar_screen.dart';
import 'package:componentss/features/search/upload_post_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTagIndex = 0;
  int currentCardIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 1);
  final SortApi sortApi = SortApi();

  List<PostModel> posts = []; // 📌 불러온 게시글 리스트
  bool isLoading = false; // 📌 로딩 상태

  // 태그 목록
  final List<String> tagNames = [
    "popular",
    "latest",
    "major",
    "academic",
    "art",
    "hobby",
    "volunteer",
    "language",
    "startup",
    "travel",
  ];

  @override
  void initState() {
    super.initState();
    fetchPosts(); // 초기 데이터 불러오기
  }

  // 📌 태그 선택 시 API 호출
  void onTagSelected(int index) async {
    setState(() {
      selectedTagIndex = index;
      // isLoading = true; // 로딩 시작
    });

    // try {
    //   List<PostModel> sortedPosts = await sortApi.sortPosts(
    //     tag: tagNames[index],
    //   );
    //   setState(() {
    //     posts = sortedPosts;
    //   });
    // } catch (e) {
    //   print("❌ 데이터 불러오기 실패: $e");
    // } finally {
    //   setState(() {
    //     isLoading = false; // 로딩 완료
    //   });
    // }
  }

  // 📌 초기 데이터 불러오기
  void fetchPosts() async {
    // setState(() {
    //   isLoading = true;
    // });

    // try {
    //   List<PostModel> sortedPosts = await sortApi.sortPosts(
    //     tag: tagNames[selectedTagIndex],
    //   );
    //   setState(() {
    //     posts = sortedPosts;
    //   });
    // } catch (e) {
    //   print("❌ 데이터 불러오기 실패: $e");
    // } finally {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          '탐색',
                          style: TextStyle(
                            color: Color(0xFF1C1C1C),
                            fontSize: 60.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Spacer(),
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
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          isLoading
              ? SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ), // 📌 로딩 상태 표시
              )
              : SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostScreen()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 992.w,
                        height: 290.h,
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Color(0xffECECEC)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                post.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }, childCount: posts.length),
              ),
        ],
      ),
    );
  }
}

class _SearchBar extends SliverPersistentHeaderDelegate {
  final int selectedTagIndex;
  final Function(int) onTagSelected;

  final List<Map<String, String>> categoryDict = [
    {'icon': '🔥', 'text': '인기'},
    {'icon': '⏱️', 'text': '최근'},
    {'icon': '💻', 'text': '전공'},
    {'icon': '📚', 'text': '학술'},
    {'icon': '🎨', 'text': '예술'},
    {'icon': '👥', 'text': '취미'},
    {'icon': '☀️', 'text': '봉사'},
    {'icon': '🔠', 'text': '어학'},
    {'icon': '🤝', 'text': '창업'},
    {'icon': '✈️', 'text': '여행'},
  ];

  _SearchBar({required this.selectedTagIndex, required this.onTagSelected});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoryDict.length, (index) {
          return GestureDetector(
            onTap: () => onTagSelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    selectedTagIndex == index
                        ? Colors.orange.shade100
                        : Colors.white,
                border: Border.all(
                  color:
                      selectedTagIndex == index
                          ? Colors.orange
                          : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  Text(categoryDict[index]["icon"]!),
                  SizedBox(width: 5),
                  Text(categoryDict[index]["text"]!),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  double get minExtent => 50;
  @override
  double get maxExtent => 50;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

import 'package:componentss/features/search/view/post_screen.dart';
import 'package:componentss/features/search/viewmodel/search_bar_view_model.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarScreen extends ConsumerStatefulWidget {
  const SearchBarScreen({super.key});

  @override
  ConsumerState<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends ConsumerState<SearchBarScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 3),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CustomIcon.back, size: 19),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 380,
            height: 45,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffECECEC),
                hintText: "모집 중인 스터디, 공고 검색하기",
                hintStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.only(left: 20),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(Icons.search, size: 28),
                ),
              ),
              onChanged: (text) {
                ref
                    .read(searchBarViewModelProvider.notifier)
                    .updateSearchText(text);
                ref.read(searchBarViewModelProvider.notifier).searchPosts(text);
              },
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child:
                ref.watch(searchBarViewModelProvider).isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ref.watch(searchBarViewModelProvider).isLoading
                    ? const Center(
                      child: Text(
                        "검색 결과가 없습니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                    : ListView.builder(
                      itemCount:
                          ref
                              .watch(searchBarViewModelProvider)
                              .searchResults
                              .length,
                      itemBuilder: (context, index) {
                        final post =
                            ref
                                .watch(searchBarViewModelProvider)
                                .searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(post: post),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 5,
                            ),
                            color: Color(0xffFFFFFF),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                color: Color(0xffECECEC),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          post.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(post.content),
                                        Text(post.content),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 130),
                                post.imageUrl != null
                                    ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.r),
                                        ),
                                      ),
                                      child: Image.network(
                                        post.imageUrl!,
                                        width: 168.w,
                                        height: 168.h,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                    : Container(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

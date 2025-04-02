import 'package:componentss/features/search/data/post_model.dart';
import 'package:componentss/features/search/data/search_api.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final TextEditingController _controller = TextEditingController();
  final SearchApi _searchApi = SearchApi();
  List<PostModel> searchResults = [];
  bool isLoading = false;

  void _searchPosts(String query) async {
    if (query.isEmpty) {
      setState(() => searchResults.clear());
      return;
    }
    setState(() => isLoading = true);

    try {
      final results = await _searchApi.searchPosts(query);
      setState(() => searchResults = results);
    } catch (e) {
      print('검색 오류: $e');
    }
    setState(() => isLoading = false);
  }

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
              onChanged: _searchPosts,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : searchResults.isEmpty
                    ? const Center(
                      child: Text(
                        "검색 결과가 없습니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                    : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final post = searchResults[index];
                        return Card(
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
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

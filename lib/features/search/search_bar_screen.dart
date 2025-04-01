import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List<Map<String, dynamic>> filterdList = [];
  // void _filterList(String keyword) {
  //   setState(() {
  //     filterdList =
  //         list
  //             .where((element) => element["title"].toString().contains(keyword))
  //             .toList();
  //   });
  // }

  // final List<Map<String, dynamic>> list = [
  //   {
  //     "title": "클수록 엄마체형 닮는다는 말 공감해??",
  //     "view": 1131,
  //     "reaction": 26,
  //     "comment": 39,
  //   },
  //   {
  //     "title": "클수록 엄마체형 닮는다는 말 공감해??",
  //     "view": 1131,
  //     "reaction": 26,
  //     "comment": 39,
  //   },
  //   {
  //     "title": "클수록 엄마체형 닮는다는 말 공감해??",
  //     "view": 1131,
  //     "reaction": 26,
  //     "comment": 39,
  //   },
  //   {
  //     "title": "클수록 엄마체형 닮는다는 말 공감해??",
  //     "view": 1131,
  //     "reaction": 26,
  //     "comment": 39,
  //   },
  //   {
  //     "title": "다이어트 성공한 사람들 비법 공유해줘!",
  //     "view": 982,
  //     "reaction": 45,
  //     "comment": 12,
  //   },
  //   {"title": "오늘 점심 뭐 먹을지 추천 좀!", "view": 450, "reaction": 10, "comment": 5},
  //   {"title": "운동 루틴 공유합니다!", "view": 1234, "reaction": 78, "comment": 56},
  //   {"title": "여행 가고 싶은데 어디가 좋을까?", "view": 789, "reaction": 34, "comment": 20},
  //   {"title": "새로운 취미 추천해주세요!", "view": 321, "reaction": 15, "comment": 8},
  //   {"title": "요즘 읽을만한 책 추천 부탁!", "view": 654, "reaction": 22, "comment": 14},
  // ];
  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   filterdList = List.from(list);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 20, left: 3),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CustomIcon.back, size: 19),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: 380,
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffECECEC),
                hintText: "모집 중인 스터디, 공고 검색하기",
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.search, size: 28),
                ),
              ),
              controller: _controller,
              // onChanged: _filterList,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: ListView.builder(
              itemCount: filterdList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [const SizedBox(height: 80)],
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

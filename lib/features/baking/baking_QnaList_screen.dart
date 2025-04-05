import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/baking/data/qna_list_model.dart';


class QnaListPage extends StatefulWidget {
  const QnaListPage({Key? key}) : super(key: key);

  @override
  State<QnaListPage> createState() => _QnaListPageState();
}

class _QnaListPageState extends State<QnaListPage> {
  // 예시 데이터 (실제로는 API 등에서 가져와야 함)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // 뒤로가기 버튼
          icon: Icon(Icons.arrow_back_ios_new), // iOS 스타일 아이콘
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '나만의 모범 답안',
          style: TextStyle(
            color: const Color(0xFF1C1C1C) /* main-black */,
            fontSize: 55.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w700,
            letterSpacing: -0.55,
          ),
        ),

        centerTitle: false,
        // 제목 왼쪽 정렬 (기본값)
        backgroundColor: Colors.white,
        // AppBar 배경색
        foregroundColor: Colors.black, // AppBar 아이콘/텍스트 색상
      ),
      body:
      SingleChildScrollView(
        child: QnaListView(qnaItems: qnaList),
      ),

      backgroundColor: Colors.white, // 전체 페이지 배경색
    );
  }
}

class QnaCard extends StatelessWidget {
  final String question;
  final String answer;

  const QnaCard({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0), // 카드 사이의 하단 간격
      padding: const EdgeInsets.all(16.0), // 카드 내부 여백
      decoration: BoxDecoration(
        color: Colors.white, // 연한 회색 배경
        border: Border.all(
          color: Colors.grey[300]!, // 약간 회색 테두리
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0), // 약간 둥근 모서리
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 내용을 왼쪽 정렬
        children: [
          // 질문 텍스트
          Text(
            question,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.0), // 질문과 답변 사이 간격
          // 답변 텍스트 (최대 2줄, 넘치면 ... 처리)
          Text(
            answer,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700], // 약간 진한 회색
              height: 1.4, // 줄 간격 살짝 조정
            ),
            maxLines: 2, // 최대 2줄까지 표시
            overflow: TextOverflow.ellipsis, // 2줄 넘어가면 말줄임표(...) 표시
          ),
        ],
      ),
    );
  }
}

class QnaListView extends StatelessWidget {
  // 이 위젯이 표시할 질문/답변 데이터 리스트
  final List<QnaItem> qnaItems;

  const QnaListView({
    Key? key,
    required this.qnaItems, // 데이터를 필수로 받도록 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터가 비어있는 경우 처리 (선택 사항)
    if (qnaItems.isEmpty) {
      return Center(child: Text('표시할 내용이 없습니다.'));
    }

    // 기존 QnaListPage의 body 부분에 있던 ListView.builder 로직
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0), // 리스트 전체의 좌우상하 여백
      itemCount: qnaItems.length, // 전달받은 데이터 리스트의 길이 사용
      itemBuilder: (context, index) {
        // 현재 인덱스에 해당하는 데이터 가져오기
        final item = qnaItems[index];
        // QnaCard 위젯 생성 및 데이터 전달
        return QnaCard(
          question: item.question,
          answer: item.answer,
        );
      },
    );
  }
}

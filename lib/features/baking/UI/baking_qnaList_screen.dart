import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/baking/data/answer/answer_api.dart';
import 'package:componentss/features/baking/data/answer/answer.dart';

class QnaListPage extends StatefulWidget {
  const QnaListPage({super.key});

  @override
  State<QnaListPage> createState() => _QnaListPageState();
}

class _QnaListPageState extends State<QnaListPage> {
  List<Answer> qnaItems = []; // API에서 가져올 데이터 리스트
  bool isLoading = true; // 로딩 상태

  @override
  void initState() {
    super.initState();
    _loadAnswers(); // API 호출
  }

  Future<void> _loadAnswers() async {
    try {
      const String userId = '0'; // 실제 userId로 대체
      final answers = await AnswerApi.fetchAnswersByUserId(userId);

      setState(() {
        qnaItems = answers; // API에서 가져온 데이터를 상태에 저장
        isLoading = false; // 로딩 완료
      });
    } catch (e) {
      print('❌ 답변 데이터를 가져오는 중 오류 발생: $e');
      setState(() {
        isLoading = false; // 로딩 실패
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '나만의 모범 답안',
          style: TextStyle(
            color: const Color(0xFF1C1C1C),
            fontSize: 55.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w700,
            letterSpacing: -0.55,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator()) // 로딩 중
              : qnaItems.isEmpty
              ? const Center(
                child: Text(
                  '표시할 답변이 없습니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : SingleChildScrollView(child: QnaListView(qnaItems: qnaItems)),
      backgroundColor: Colors.white,
    );
  }
}

class QnaCard extends StatelessWidget {
  final String question;
  final String answer;

  const QnaCard({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => QnaViewScreen(question: question, answer: answer),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              answer,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class QnaListView extends StatelessWidget {
  final List<Answer> qnaItems; // Answer 모델 리스트

  const QnaListView({super.key, required this.qnaItems});

  @override
  Widget build(BuildContext context) {
    if (qnaItems.isEmpty) {
      return const Center(child: Text('표시할 내용이 없습니다.'));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: qnaItems.length,
      itemBuilder: (context, index) {
        final item = qnaItems[index];
        return QnaCard(question: item.question ?? '질문 없음', answer: item.answer);
      },
    );
  }
}

class QnaViewScreen extends StatelessWidget {
  final String question;
  final String answer;

  const QnaViewScreen({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            // 뒤로가기 버튼
            icon: Icon(Icons.arrow_back_ios_new), // iOS 스타일 아이콘
            onPressed: () => Navigator.of(context).pop(),
          ),

          backgroundColor: Colors.white,
          // AppBar 배경색
          foregroundColor: Colors.black, // AppBar 아이콘/텍스트 색상
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                question,
                style: TextStyle(
                  color: const Color(0xFF1C1C1C) /* main-black */,
                  fontSize: 60.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                answer,
                style: TextStyle(
                  color: const Color(0xFF1C1C1C) /* main-black */,
                  fontSize: 40.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

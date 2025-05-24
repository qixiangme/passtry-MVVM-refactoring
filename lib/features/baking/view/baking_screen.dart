import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/view/baking_qnaList_screen.dart';
import 'package:componentss/features/baking/view/setting/study_make_screen.dart';
import 'package:componentss/features/baking/view/widget/AnimatedHalfCircleProgress.dart'
    as baking;
import 'package:componentss/features/baking/view/widget/EventCard.dart';
import 'package:componentss/features/baking/view/widget/attendence_selection.dart';
import 'package:componentss/features/baking/view/widget/quest_item.dart';

import 'package:componentss/features/baking/viewmodel/baking_screen_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelInfo {
  final String badgeText;
  final String titleText;
  const LevelInfo({required this.badgeText, required this.titleText});
}

// --- 위에서 정의한 levelData 리스트 ---
final List<LevelInfo> levelData = [
  const LevelInfo(badgeText: 'Lv.0', titleText: '알 수 없음'), // 인덱스 0 (기본값)
  const LevelInfo(badgeText: 'Lv.1', titleText: '따끈따끈한 반죽'),
  const LevelInfo(badgeText: 'Lv.2', titleText: '살짝 익은 스콘'),
  const LevelInfo(badgeText: 'Lv.3', titleText: '노릇노릇한 식빵'),
  const LevelInfo(badgeText: 'Lv.4', titleText: '달콤한 케이크'),
  const LevelInfo(badgeText: 'Lv.5', titleText: '제빵의 달인'),
];

class BakingScreen extends ConsumerStatefulWidget {
  const BakingScreen({super.key});

  @override
  ConsumerState<BakingScreen> createState() => _BakingScreenState();
}

class _BakingScreenState extends ConsumerState<BakingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = ref.watch(BakingScreenViewModelProvider);
    final vm = ref.watch(BakingScreenViewModelProvider.notifier);

    // UserProvider를 통해 사용자 정보 가져오기
    final user = ref.watch(userProvider);
    if (user != null && state.interviews.isNotEmpty) {
      // 첫 번째 인터뷰의 ID로 D-day 데이터 가져오기
      vm.fetchDday(state.interviews[state.index].id!);
    }
    vm.loadInterviews(user!).then((_) {
      if (state.interviews.isNotEmpty) {
        vm.loadMissionAndAttendanceData(state.index, user); // 첫 번째 인터뷰 사용
      }
    });
    vm.loadQnaItems(user);
    vm.loadUserScore(user);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final state = ref.watch(BakingScreenViewModelProvider);
    final vm = ref.watch(BakingScreenViewModelProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  //width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Image(
                          width: 150,
                          height: 70,
                          image: AssetImage('assets/icons/passtry_header.png'),
                        ),
                      ),

                      SizedBox(height: 10),

                      Center(
                        child:
                            state.isLoadingDday || state.interviews.isEmpty
                                ? const CircularProgressIndicator() // 로딩 중일 때 표시
                                : EventCard(
                                  title:
                                      state
                                          .interviews[state.index]
                                          .name, // 인터뷰 이름 표시
                                ),
                      ),

                      Row(
                        children: [
                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),

                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),

                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Center(
                            child: baking.AnimatedHalfCircleProgress(
                              progress: state.progress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Center(
                              child: Container(
                                width: 611.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      vm.getImageForScore(state.userScore ?? 0),
                                    ), // AssetImage를 DecorationImage로 감쌈
                                    fit: BoxFit.cover, // 이미지 크기 조정
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0x21FF9F1C),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.96.w,
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                              ),
                              borderRadius: BorderRadius.circular(29.57.w),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 29.57.w,
                            children: [
                              Text(
                                state.levelText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(
                                    0xFFFF9F1C,
                                  ) /* main-orange */,
                                  fontSize: 36.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Center(
                            child: Text(
                              state.titleText,
                              style: TextStyle(
                                color: Colors.black /* white */,
                                fontSize: 66.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 200.h),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '이번 주 출석 현황',
                          style: TextStyle(
                            color: Colors.black /* white */,
                            fontSize: 50.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      buildAttendanceSection(ref),

                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '일일 퀘스트',
                          style: TextStyle(
                            color: Colors.black /* white */,
                            fontSize: 50.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          // map을 사용하여 각 Quest 객체를 _buildQuestItem 위젯으로 변환
                          // .toList()로 위젯 리스트 생성
                          children:
                              state.dailyQuests
                                  .map(
                                    (quest) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10.0,
                                      ),
                                      child: buildQuestItem(
                                        quest,
                                        state.missionResponse!,
                                        context,
                                        ref,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '나만의 모범 답안',
                              style: TextStyle(
                                color: Colors.black /* white */,
                                fontSize: 50.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return QnaListPage();
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  const Text('전체보기'),
                                  Icon(Icons.arrow_forward_ios, size: 15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      state.isLoadingQna
                          ? const Center(
                            child: CircularProgressIndicator(),
                          ) // 로딩 중
                          : state.qnaItems.isEmpty
                          ? const Center(
                            child: Text(
                              '표시할 답변이 없습니다.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                          : QnaListView(qnaItems: state.qnaItems),

                      //Padding(
                      //  padding: EdgeInsets.only(left: 20, right: 20),
                      //  child: Column(
                      //    children: [
                    ],
                  ),
                ),
                if (state.isExpanded)
                  GestureDetector(
                    onTap: () {
                      vm.toggleExpanded();
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.7), // 반투명 검정색 배경
                      width: 10000,
                      height: 10000,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, // 버튼들을 아래쪽에 정렬
        crossAxisAlignment: CrossAxisAlignment.end, // 가운데 정렬df
        children: [
          // 확장된 상태에서 표시되는 버튼들
          if (state.isExpanded)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // 버튼과 텍스트를 가운데 정렬
                    children: [
                      const SizedBox(width: 10), // 버튼과 텍스트 사이 간격
                      const Text(
                        '목표 추가하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),

                      FloatingActionButton(
                        heroTag: 'always_visible',
                        backgroundColor: Colors.orange,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ), // 동그라미 버튼
                        onPressed: () {
                          // StudyMake 화면으로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudyMake(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // 추가 확장 버튼들 (예: 인터뷰 버튼)
                ...List.generate(state.interviews.length, (index) {
                  final interview = state.interviews[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            interview.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 14),

                        FloatingActionButton(
                          shape: CircleBorder(),
                          heroTag: 'interview_$index',
                          backgroundColor: Colors.orange,
                          // icon: const Icon(Icons.person, color: Colors.orange),
                          // label: Text(
                          //   interview.name, // 인터뷰 이름 표시
                          //   style: const TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          onPressed: () {
                            vm.setIndex(index);
                            vm.loadMissionAndAttendanceData(index, user!);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),

          // 메인 플로팅 버튼 (토글 기능)
          FloatingActionButton(
            shape: CircleBorder(),
            heroTag: 'main_fab',
            backgroundColor: Colors.orange,
            child: Icon(
              state.isExpanded ? Icons.close : Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              vm.toggleExpanded();
            },
          ),
        ],
      ),
    );
  }
}

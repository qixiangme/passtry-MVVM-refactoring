import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/view/study_screen.dart';
import 'package:componentss/features/study/viewmodel/search_group_view_mode.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchGroupScreen extends ConsumerStatefulWidget {
  const SearchGroupScreen({super.key});

  @override
  ConsumerState<SearchGroupScreen> createState() => _SearchGroupScreenState();
}

class _SearchGroupScreenState extends ConsumerState<SearchGroupScreen> {
  @override
  void initState() {
    super.initState();
    final viewmodel = ref.watch(SearchGroupViewModelProvider.notifier);
    final state = ref.watch(SearchGroupViewModelProvider);
    state.controller.addListener(() {
      if (state.controller.text.length == 4) {
        state.copyWith(isButtonEnabled: true);
      } else {
        state.copyWith(isButtonEnabled: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final userId = user?.id ?? "unknown";
    final viewmodel = ref.watch(SearchGroupViewModelProvider.notifier);
    final state = ref.watch(SearchGroupViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(CustomIcon.back, size: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "찾고 있는 빵집 주소 네 자리를\n입력해주세요",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 70),

              // 네모 박스 (클릭하면 키보드 열림)
              Padding(
                padding: EdgeInsets.only(left: 1),
                child: GestureDetector(
                  onTap: () => state.focusNode.requestFocus(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 87,
                        height: 87,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC4CAD4)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          state.digits[index], // 입력된 숫자 표시
                          style: const TextStyle(
                            color: Color(0xff6B6B6B),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // 숨겨진 텍스트필드 (숫자 입력 감지)
              Opacity(
                opacity: 0, // 안 보이게 설정
                child: TextField(
                  controller: state.controller,
                  focusNode: state.focusNode,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    state.copyWith(
                      digits: List.generate(
                        4,
                        (index) => index < text.length ? text[index] : "",
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 400),
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (state.isButtonEnabled) {
                        // 검색하기 버튼 클릭 시
                        final GroupModel? group = await viewmodel.searchGroup();

                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(38.5.r),
                                ),
                              ),

                              height: 500,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  SizedBox(height: 60),

                                  if (group!.imageUrl !=
                                      null) // 이미지 URL이 존재하는 경우만 표시
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ), // 이미지 둥근 모서리
                                      child: Image.network(
                                        group.imageUrl!,
                                        height: 200, // 이미지 높이
                                        width: 200, // 이미지 너비
                                        fit: BoxFit.cover, // 이미지 크기 조정
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Icon(
                                            Icons.broken_image,
                                            size: 100,
                                            color: Colors.grey,
                                          );
                                        },
                                      ),
                                    ),
                                  Center(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: group.name,
                                            style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "을",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "찾고 계셨군요!",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 479.w,
                                          height: 160.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xFFFF9F1C),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(33.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "다시 입력하기",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFFF9F1C),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () async {
                                          // <-- async 추가
                                          try {
                                            // !!! 여기서 그룹 참여 API를 호출합니다. !!!
                                            bool joinSuccess = await viewmodel
                                                .joinGroup(
                                                  group.joinCode,
                                                  userId,
                                                ); // joinGroup이 성공 여부를 반환한다고 가정

                                            if (joinSuccess) {
                                              // 참여 성공 시 화면 이동
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => MainScreen(
                                                        goToPage: 1,
                                                      ),
                                                ),
                                              );
                                            } else {
                                              // 참여 실패 시 사용자에게 알림 (예: 스낵바)
                                              Navigator.pop(context); // 모달 닫기
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '그룹 참여에 실패했습니다.',
                                                  ),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            // API 호출 중 에러 발생 시 처리
                                            Navigator.pop(context); // 모달 닫기
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text('오류가 발생했습니다: $e'),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 479.w,
                                          height: 160.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF9F1C),
                                            border: Border.all(
                                              color: Color(0xFFFF9F1C),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(33.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "참여하기",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),

                      width: 991.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        color:
                            state.isButtonEnabled
                                ? Color(0XFFFF9F1C)
                                : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(38.5.r)),
                        border: Border.all(color: Color(0XFFFF9F1C)),
                      ),
                      child: Center(
                        child: Text(
                          state.isButtonEnabled ? "다음" : "검색하기",
                          style: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                state.isButtonEnabled
                                    ? Colors.white
                                    : Color(0XFFFF9F1C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    final viewmodel = ref.watch(SearchGroupViewModelProvider.notifier);
    final state = ref.watch(SearchGroupViewModelProvider);
    state.controller.dispose();
    state.focusNode.dispose();
    super.dispose();
  }
}

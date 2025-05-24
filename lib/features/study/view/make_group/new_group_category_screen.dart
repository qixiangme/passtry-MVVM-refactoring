import 'package:componentss/features/study/viewmodel/make_group/new_group_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/study/view/make_group/new_group_name_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'widget/category_item.dart';
import 'widget/next_button1.dart';

class NewGroupCategoryScreen extends ConsumerStatefulWidget {
  const NewGroupCategoryScreen({super.key});

  @override
  ConsumerState<NewGroupCategoryScreen> createState() =>
      _NewGroupCategoryScreenState();
}

class _NewGroupCategoryScreenState
    extends ConsumerState<NewGroupCategoryScreen> {
  bool _isNextButtonClicked = false; // 버튼 상태를 부모에서 관리

  String? _selectedCategoryItemText;
  final bool _isNextButtonEnabled = false;

  // 다음 버튼 탭 처리 및 네비게이션 함수
  void _handleNextButtonTap() {
    // 1. 버튼 클릭 상태 변경 (UI 즉시 업데이트)

    if (_isNextButtonEnabled) {
      print("--- 다음 버튼 클릭 ---");
      print("선택된 단체: ${_selectedCategoryItemText ?? '선택되지 않음'}");
      print("--------------------");
      setState(() {
        _isNextButtonClicked = true;
      });

      // 2. 다음 화면으로 이동하고, 돌아왔을 때 실행될 로직 추가
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewGroupNameScreen(),
          settings: RouteSettings(
            arguments: {'category': _selectedCategoryItemText}, // 전달할 데이터
          ),
        ),
      ).then((_) {
        // StudyMakeGroup2 에서 돌아온 후에 이 코드가 실행됨
        // 위젯이 화면에 아직 마운트되어 있는지 확인 (중요)
        if (mounted) {
          // 3. 버튼 상태를 다시 false로 초기화
          setState(() {
            _isNextButtonClicked = false;
          });
        }
      });
    } else {
      print("다음 버튼 클릭 불가");
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.watch(NewGroupCategoryViewModelProvider.notifier);
    final state = ref.watch(NewGroupCategoryViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Text(
                  '어떤 면접을 준비하고 있는\n사람들과 함께하고 싶으신가요?',
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
                    fontSize: 60.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '준비하고 있는 단체와 분야를 알려주세요',
                  style: TextStyle(
                    color: const Color(0xFF8E95A2),
                    fontSize: 44.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.44,
                  ),
                ),
                SizedBox(height: 120.h),
                Container(
                  width: 992.w,
                  padding: (EdgeInsets.symmetric(horizontal: 10.w)),
                  child: CategoryItems(
                    onItemSelected: viewmodel.selectedCategory,
                  ),
                ),

                SizedBox(height: 100.h),

                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 200.h),
                  child: Center(
                    child: NextButton1(
                      isEnabled: _isNextButtonEnabled,
                      onTap: _handleNextButtonTap,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


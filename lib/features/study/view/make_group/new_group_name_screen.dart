import 'dart:io';
import 'package:componentss/features/study/view/make_group/widget/add_image_continer.dart';
import 'package:componentss/features/study/viewmodel/make_group/new_group_name_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'widget/next_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewGroupNameScreen extends ConsumerStatefulWidget {
  const NewGroupNameScreen({super.key});

  @override
  ConsumerState<NewGroupNameScreen> createState() => _NewGroupNameScreen();
}

class _NewGroupNameScreen extends ConsumerState<NewGroupNameScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(NewGroupNameViewModelProvider.notifier);
    final state = ref.watch(NewGroupNameViewModelProvider);
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 77.w),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  Text(
                    '빵집 이름을 지어주세요',
                    style: TextStyle(
                      color: const Color(0xFF1F1F1F),
                      fontSize: 70.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 200.h),
                  Center(
                    child: AddImageContainer(
                      onImageSelected: vm.handleImageSelected,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: SizedBox(
                      width: 900.w,
                      height: 200.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 110.h,
                        children: [
                          Center(
                            child: Container(
                              width: 904.75.w,
                              padding: const EdgeInsets.only(top: 15),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 27.50.h,
                                children: [
                                  SizedBox(
                                    width: 900.w,
                                    child: TextField(
                                      onChanged: (text) {
                                        vm.handleNameSelected(text);
                                        print("입력된 텍스트: $text");
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'ex) 면접 만점 암기빵 맛집',
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8E95A2),
                                          fontSize: 44.sp,
                                          fontFamily: 'Wanted Sans',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.44,
                                        ),
                                        border: UnderlineInputBorder(
                                          // 밑줄 테두리 추가
                                          borderSide: BorderSide(
                                            color:
                                                Colors
                                                    .grey
                                                    .shade200, // 테두리 색상 설정
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade900,
                                          ), // 원하는 색상으로 변경
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.text,
                                      // 키보드 타입 설정
                                      obscureText: false,
                                      // 비밀번호 입력 모드 여부
                                      maxLines: 1,
                                      // 최대 줄 수
                                      autocorrect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 680.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 200.h),
                    child: Center(
                      child: NextButton2(
                        isEnabled: state.isNextButtonEnabled,
                        onTap: () => vm.handleNextButtonTap(ref,context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

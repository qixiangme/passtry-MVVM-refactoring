import 'package:componentss/features/pages_list.dart';
import 'package:flutter/material.dart';
import 'package:componentss/core/widgets/customBottomNavigationBar.dart';

class MainScreen extends StatefulWidget {
  final int goToPage;
  const MainScreen({super.key, required this.goToPage});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // goToPage가 전달되면 해당 페이지로 초기화
    _currentIndex = widget.goToPage;
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

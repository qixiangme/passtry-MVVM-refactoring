import 'package:flutter/material.dart';
import 'package:componentss/core/widgets/customBottomNavigationBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Color(0xffFF8741)),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

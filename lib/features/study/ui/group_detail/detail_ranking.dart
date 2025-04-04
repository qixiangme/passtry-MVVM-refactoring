import 'package:flutter/material.dart';

class DetailRanking extends StatefulWidget {
  const DetailRanking({super.key});

  @override
  State<DetailRanking> createState() => _DetailRankingState();
}

class _DetailRankingState extends State<DetailRanking> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(decoration: BoxDecoration(color: Color(0xFF434343))),
    );
  }
}

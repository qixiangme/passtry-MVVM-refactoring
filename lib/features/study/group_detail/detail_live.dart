import 'package:flutter/material.dart';

class DetailLive extends StatefulWidget {
  const DetailLive({super.key});

  @override
  State<DetailLive> createState() => _DetailLiveState();
}

class _DetailLiveState extends State<DetailLive> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(decoration: BoxDecoration(color: Color(0xFF434343))),
    );
  }
}

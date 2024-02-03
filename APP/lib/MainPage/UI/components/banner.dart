import 'package:flutter/material.dart';

class Bannernew extends StatelessWidget {
  final String imglink;
  Bannernew({super.key, required this.imglink});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Container(
      width: width * 0.37,
      height: height * 0.2175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.symmetric(),
        color: Color(0xffffffff),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'assets/icons/$imglink.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

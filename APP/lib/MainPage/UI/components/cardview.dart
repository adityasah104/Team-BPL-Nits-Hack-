import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String imgname;
  final String title;
  final VoidCallback ontap;
  const CardView(
      {super.key,
      required this.imgname,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.063, height * 0.0225, width * 0.063, height * 0.0075),
        width: width * 0.28,
        // height: height * 0.11875,
        //  height: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff000000), width: 1.5),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [Image.asset('assets/icons/$imgname.png'), Text(title)],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  automaticallyImplyLeading: false,
        title: Center(child: Text('Spam Activity Detected')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LottieBuilder.asset('assets/icons/spam.json')],
          ),
          Text(
            'SPAM URL FOUND',
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

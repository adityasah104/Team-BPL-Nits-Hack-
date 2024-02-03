import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SafeLink extends StatelessWidget {
  const SafeLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(child: Text('Safe Activity Detected')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/icons/notspam.json'),
          Text(
            'SAFE URL FOUND',
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:dark_pattern_detector/utils/snakbar.dart';
import 'package:flutter/services.dart';
import 'package:dark_pattern_detector/results_sucess.dart';
import 'package:dark_pattern_detector/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dark_pattern_detector/safelink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ExamOpen extends StatefulWidget {
  final String url;
  final String title;
  const ExamOpen({Key? key, required this.url, required this.title});

  @override
  State<ExamOpen> createState() => _ExamOpenState();
}

class _ExamOpenState extends State<ExamOpen> {
  late InAppWebViewController _webViewController;
  bool loading = false;
  int count = 0;
  String _prediction = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true; // Allow the app to be closed
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  userAgent:
                      '(Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Mobile Safari/537.36',
                  //clearCache: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onLoadStart: (InAppWebViewController controller, Uri? url) {
                if (url.toString() != widget.url) {
                  _sendForPrediction(url.toString());
                }
              },
              onLoadStop: (InAppWebViewController controller, Uri? url) {},
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                // You can use this callback to get the loading progress.
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendForPrediction(String text) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://ec2-13-53-205-246.eu-north-1.compute.amazonaws.com:8080/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'url': text,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        setState(() {
          _prediction = responseBody['prediction'];
        });
        if (_prediction == 'Dark Pattern') {
          MySnackbar.show(context,
              'We had Detected Something Phisy In It Please Proceed Safely');
          // Utils().toastMessage(
          //     context,
          //     'We had Detected Some Dark Pattern In It Please Proceed Safely',
          //     Colors.red,
          //     5);
          HapticFeedback.vibrate();
          // print('dark');
        } else {
          MySnackbar.show(
              context, 'This is a safe website you can proceed safely');
          // Utils().toastMessage(context,
          //     'This is a safe website you can proceed safely', Colors.green, 2);
          //  print('white');
        }
      } else {
        setState(() {
          _prediction =
              'Failed to get prediction. Status Code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _prediction = 'Failed to send data: $e';
      });
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dark_pattern_detector/results_sucess.dart';
import 'package:dark_pattern_detector/rounbuttonnew.dart';
import 'package:dark_pattern_detector/safelink.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  int count = 0;
  final urltextcontroller = TextEditingController();
  String _prediction = '';
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TRULINK')),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
          child: TextFormField(
            controller: urltextcontroller,
            decoration: const InputDecoration(
                hintText: 'Enter Your URL',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(color: Color(0xFF7455F7), width: 3)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xFF7455F7), width: 3),
                ),
                //helperText: 'Enter your email',
                prefixIcon: Icon(
                  Icons.link,
                  color: Color(0xFF7455F7),
                )),
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
        Roundbuttonnew(
            title: 'Check',
            loading: loading,
            ontap: () {
              setState(() {
                loading = true;
              });
              if (urltextcontroller.text.isNotEmpty) {
                _sendForPrediction(urltextcontroller.text);
              }
            }),
        SizedBox(height: 20),
      ]),
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
          setState(() {
            loading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sucess(),
              ));
          print('dark');
        } else {
          setState(() {
            loading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SafeLink(),
              ));
          print('white');
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

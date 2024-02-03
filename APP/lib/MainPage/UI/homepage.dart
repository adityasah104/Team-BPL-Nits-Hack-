import 'dart:convert';
import 'package:dark_pattern_detector/MainPage/community.dart';
import 'package:dark_pattern_detector/Resources/resources.dart';
import 'package:dark_pattern_detector/web.dart';
import 'package:http/http.dart' as http;
import 'package:dark_pattern_detector/MainPage/UI/components/banner.dart';
import 'package:dark_pattern_detector/MainPage/UI/components/cardview.dart';
import 'package:dark_pattern_detector/results_sucess.dart';
import 'package:dark_pattern_detector/safelink.dart';
import 'package:flutter/material.dart';

class NewHomeUi extends StatefulWidget {
  const NewHomeUi({super.key});

  @override
  State<NewHomeUi> createState() => _NewHomeUiState();
}

class _NewHomeUiState extends State<NewHomeUi> {
  final urltextcontroller = TextEditingController();
  String _prediction = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    // group59SRJ (900:1082)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    width: width * 0.25,
                    height: height * 0.0425,
                    decoration: BoxDecoration(
                      color: Color(0xff0a1e51),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Feeds',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Bannernew(
                      imglink: 'bn3',
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Bannernew(
                      imglink: 'bn2',
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Bannernew(
                      imglink: 'bn4',
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Bannernew(
                      imglink: 'bn1',
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width * 0.9,
                height: height * 0.05,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                        ),
                        controller: urltextcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Paste URL You Want To Scan',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.012,
                              horizontal: width * 0.03),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0Xff0A1E51),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        if (urltextcontroller.text.isNotEmpty) {
                          _sendForPrediction(urltextcontroller.text);
                        }

                        // Handle the button press or perform any action here with the entered text
                      },
                      child: Text('CHECK'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Container(
                    // group59SRJ (900:1082)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    width: width * 0.336,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xff0a1e51),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CATEGORY',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CardView(
                    ontap: () {},
                    imgname: "sms",
                    title: 'SMS',
                  ),
                  Spacer(),
                  CardView(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Community(),
                          ));
                    },
                    imgname: 'community',
                    title: 'HELP',
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CardView(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResourcesScreen()));
                    },
                    imgname: "resources",
                    title: 'LEARN',
                  ),
                  Spacer(),
                  CardView(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamOpen(
                                url: 'https://www.google.com/', title: 'title'),
                          ));
                    },
                    imgname: 'browser',
                    title: 'WEB',
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
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

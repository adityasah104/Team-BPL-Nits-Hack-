import 'package:dark_pattern_detector/rounbuttonnew.dart';
import 'package:dark_pattern_detector/utils/utils.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    final urltextcontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contribute To Community'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: TextFormField(
                  controller: urltextcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter Issue Heading',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide:
                              BorderSide(color: Color(0xff0a1e51), width: 3)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Color(0xff0a1e51), width: 3),
                      ),
                      //helperText: 'Enter your email',
                      prefixIcon: Icon(
                        Icons.error,
                        color: Color(0xff0a1e51),
                      )),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: TextFormField(
                  maxLines: 10,
                  controller: urltextcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter Discription Of Issue',
                    hintStyle: TextStyle(textBaseline: TextBaseline.alphabetic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide:
                            BorderSide(color: Color(0xff0a1e51), width: 3)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Color(0xff0a1e51), width: 3),
                    ),
                    //helperText: 'Enter your email',
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Roundbuttonnew(
                  title: 'Share Issue',
                  loading: loading,
                  ontap: () {
                    setState(() {
                      loading = true;
                    });
                    performTaskAfterDelay();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void performTaskAfterDelay() {
    // Using Future.delayed to perform a task after 3 seconds
    Future.delayed(Duration(seconds: 1), () {
      // Your task to be executed after 3 seconds
      setState(() {
        loading = false;
      });
      Utils().toastMessage(
          'Feature Currently In Development', Color(0xff0a1e51), 2);
    });
  }
}

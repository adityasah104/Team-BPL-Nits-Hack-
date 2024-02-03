import 'package:dark_pattern_detector/MainPage/UI/homepage.dart';
import 'package:dark_pattern_detector/MainPage/community.dart';
import 'package:dark_pattern_detector/desktopmode.dart';
import 'package:dark_pattern_detector/home.dart';
import 'package:dark_pattern_detector/web.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      Center(child: NewHomeUi()),
      Center(child: ExamOpen(url: 'https://www.google.com/', title: '')),
      Center(
        child: Desktopmode(url: 'https://www.google.com/', title: ''),
      ),
      Center(
        child: Community(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            );
          },
        ),
        backgroundColor: Color(0Xff0A1E51),
        title: Text(
          'TrueLink',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Dainik Media'),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set the background color to black
        selectedItemColor: Color.fromARGB(255, 42, 19, 133),
        unselectedItemColor: Color.fromARGB(255, 53, 42, 48),
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.web,
            ),
            label: 'Web',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'Community ',
          ),
        ],
      ),
    );
  }
}

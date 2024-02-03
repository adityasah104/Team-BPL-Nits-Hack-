import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

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
      body: Center(
        child: Text('Feature Under Devlopment!!!!!!'),
      ),
    );
  }
}

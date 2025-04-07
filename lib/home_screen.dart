import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main App')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Open App1'),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
            ),
            ElevatedButton(
              child: Text('Open App2'),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app1/app1.dart';
import 'package:app2/app2.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main App")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const App1HomeScreen(),
                  ));
            },
            child: const Text("Open App 1"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const App2HomeScreen(),
                  ));
            },
            child: const Text("Open App 2"),
          ),
        ],
      ),
    );
  }
}

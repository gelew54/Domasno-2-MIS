import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tools'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'No parts available, sorry!',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Parts'),
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

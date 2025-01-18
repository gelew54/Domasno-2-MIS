import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Parts Shop',
      theme: _buildTheme(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => WelcomeScreen(),
        '/search': (context) => SearchScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Page Not Found'),
              backgroundColor: Colors.redAccent,
            ),
            body: const Center(
              child: Text(
                'The page you are looking for does not exist.',
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}

import 'package:flutter/material.dart';
import '../models/auto_part.dart';
import 'purchase_screen.dart';
import '../services/auto_part_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AutoPartService autoPartService = AutoPartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset(
                'assets/banner.png',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Auto-Parts-Tomkiz!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              'Find the best auto parts quickly and easily.',
              style: TextStyle(fontSize: 18, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildCategoryIcon(Icons.settings, 'Engine', context),
                  _buildCategoryIcon(Icons.directions_car, 'Body', context),
                  _buildCategoryIcon(Icons.battery_charging_full, 'Battery', context),
                  _buildCategoryIcon(Icons.build, 'Tools', context),
                  _buildCategoryIcon(Icons.tire_repair, 'Tires', context),
                  _buildCategoryIcon(Icons.more_horiz, 'More', context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/search');
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (label == 'Engine' || label == 'Battery' || label == 'Tires' || label == 'More') {

          List<AutoPart> parts = await autoPartService.getAutoParts(label);

          if (mounted) {
            if (parts.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PurchaseScreen(autoParts: parts),
                ),
              );
            } else {
              _showNoPartsAvailable(context);
            }
          }
        } else {
          if (mounted) {
            _showNoPartsAvailable(context);
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 40, color: Colors.blueAccent),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showNoPartsAvailable(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No parts available'),
          content: Text('Sorry, no parts available for this category.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

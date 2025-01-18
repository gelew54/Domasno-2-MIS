import 'package:flutter/material.dart';
import '../models/auto_part.dart';

class PurchaseScreen extends StatelessWidget {
  final List<AutoPart> autoParts;

  const PurchaseScreen({super.key, required this.autoParts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auto Parts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: autoParts.length,
          itemBuilder: (context, index) {
            final autoPart = autoParts[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Displaying the product image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          autoPart.imageUrl, // Using the correct image URL
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Product name
                      Text(
                        autoPart.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Product description
                      Text(
                        autoPart.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      // Price display
                      Text(
                        '\$${autoPart.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Buy button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text('Item added to cart!'),
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.greenAccent,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Text(
                          'BUY',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

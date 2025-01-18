import 'package:flutter/material.dart';
import 'package:auto_parts_tomkiz/models/auto_part.dart';
import 'package:auto_parts_tomkiz/services/auto_part_service.dart';
import 'purchase_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final AutoPartService autoPartService;

  const CategoryScreen({
    super.key,
    required this.category,
    required this.autoPartService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<AutoPart>>(
        future: autoPartService.getAutoParts(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No parts available for this category.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final parts = snapshot.data!;

            return ListView.builder(
              itemCount: parts.length,
              itemBuilder: (context, index) {
                final part = parts[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.asset(
                      part.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      part.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    subtitle: Text(
                      '\$${part.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.blueAccent,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchaseScreen(autoParts: [part]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          return Center(child: Text('No data available.'));
        },
      ),
    );
  }
}

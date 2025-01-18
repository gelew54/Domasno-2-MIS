import 'package:auto_parts_tomkiz/screens/purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_parts_tomkiz/services/auto_part_service.dart';
import 'category_screen.dart';
import 'package:auto_parts_tomkiz/widgets/search_bar.dart';
import 'package:auto_parts_tomkiz/models/auto_part.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AutoPartService autoPartService = AutoPartService();
  List<AutoPart> allParts = [];
  List<AutoPart> filteredParts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadParts();
  }

  Future<void> _loadParts() async {
    final fetchedParts = await _getMixedParts();
    setState(() {
      allParts = fetchedParts;
      filteredParts = fetchedParts;
    });
  }

  void _filterParts(String query) {
    setState(() {
      searchQuery = query;
      filteredParts = allParts
          .where((part) => part.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Auto Parts',
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
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AutoPartSearchBar(
                onChanged: _filterParts,
              ),
            ),
            SizedBox(height: 10),
            // Category Filter Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildCategoryChip('Rims', Icons.circle, context),
                  _buildCategoryChip('Tires', Icons.tire_repair, context),
                  _buildCategoryChip('Engine', Icons.settings, context),
                  _buildCategoryChip('Battery', Icons.battery_full, context),
                  _buildCategoryChip('Accessories', Icons.build, context),
                  _buildCategoryChip('More', Icons.more_horiz, context),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<AutoPart>>(
                future: Future.value(filteredParts),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(child: Text('No parts available.'));
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
                                  builder: (context) => PurchaseScreen(
                                    autoParts: [part],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<List<AutoPart>> _getMixedParts() async {
    final allParts = [
      AutoPart(name: 'Alloy Rim', description: 'High-quality alloy rim.', price: 120.99, imageUrl: 'assets/rim.png', category: 'Rims'),
      AutoPart(name: 'Summer Tires', description: 'Durable tires for summer roads.', price: 180.75, imageUrl: 'assets/tire2.png', category: 'Tires'),
      AutoPart(name: 'Oil Filter', description: 'Efficient oil filter for your engine.', price: 15.99, imageUrl: 'assets/oil_filter.png', category: 'Engine'),
      AutoPart(name: 'Car Battery', description: 'Reliable car battery for all weather conditions.', price: 120.50, imageUrl: 'assets/car_battery.png', category: 'Battery'),
      AutoPart(name: 'Car Seat Covers', description: 'Stylish and protective seat covers for your car seats.', price: 45.99, imageUrl: 'assets/seat_covers.png', category: 'Accessories'),
    ];

    return Future.delayed(Duration(seconds: 2), () => allParts);
  }

  Widget _buildCategoryChip(String label, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(
                category: label,
                autoPartService: autoPartService,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Chip(
          backgroundColor: Colors.white.withAlpha((0.9 * 255).toInt()),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Row(
            children: [
              Icon(icon, size: 18, color: Colors.blueAccent),
              SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

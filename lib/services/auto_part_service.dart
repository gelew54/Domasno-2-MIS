import '../models/auto_part.dart';

class AutoPartService {
  Future<List<AutoPart>> getAutoParts(String category) async {
    final allParts = [
      AutoPart(
        name: 'Alloy Rim',
        description: 'High-quality alloy rim.',
        price: 120.99,
        imageUrl: 'assets/rim.png',
        category: 'Rims',
      ),
      AutoPart(
        name: 'Steel Rim',
        description: 'Durable steel rim.',
        price: 90.50,
        imageUrl: 'assets/rim2.png',
        category: 'Rims',
      ),
      AutoPart(
        name: 'Oil Filter',
        description: 'Efficient oil filter for your engine.',
        price: 15.99,
        imageUrl: 'assets/oil_filter.png',
        category: 'Engine',
      ),
      AutoPart(
        name: 'Spark Plugs',
        description: 'High-performance spark plugs.',
        price: 25.99,
        imageUrl: 'assets/spark_plugs.png',
        category: 'Engine',
      ),
      AutoPart(
        name: 'Winter Tires',
        description: 'Reliable tires for winter conditions.',
        price: 200.99,
        imageUrl: 'assets/tire1.png',
        category: 'Tires',
      ),
      AutoPart(
        name: 'Summer Tires',
        description: 'Durable tires for summer roads.',
        price: 180.75,
        imageUrl: 'assets/tire2.png',
        category: 'Tires',
      ),
      AutoPart(
        name: 'Car Battery',
        description: 'Reliable car battery for all weather conditions.',
        price: 120.50,
        imageUrl: 'assets/car_battery.png',
        category: 'Battery',
      ),
      AutoPart(
        name: 'Car Alternator',
        description: 'High-performance alternator for consistent power supply.',
        price: 250.00,
        imageUrl: 'assets/alternator.png',
        category: 'Battery',
      ),
      AutoPart(
        name: 'Car Seat Covers',
        description: 'Stylish and protective seat covers for your car seats.',
        price: 45.99,
        imageUrl: 'assets/seat_covers.png',
        category: 'Accessories',
      ),
      AutoPart(
        name: 'Steering Wheel Cover',
        description: 'Comfortable and grippy steering wheel cover for better control.',
        price: 15.75,
        imageUrl: 'assets/steering_wheel_cover.png',
        category: 'Accessories',
      ),
      AutoPart(
        name: 'Car Floor Mats',
        description: 'Durable and easy-to-clean floor mats for interior protection.',
        price: 35.50,
        imageUrl: 'assets/floor_mats.png',
        category: 'Accessories',
      ),
      AutoPart(
        name: 'Car Phone Mount',
        description: 'Convenient phone mount for safe and hands-free driving.',
        price: 12.99,
        imageUrl: 'assets/phone_mount.png',
        category: 'More',
      ),
      AutoPart(
        name: 'Emergency Car Kit',
        description: 'Essential emergency items for your car, including first-aid supplies.',
        price: 45.00,
        imageUrl: 'assets/emergency_kit.png',
        category: 'More',
      ),
      AutoPart(
        name: 'Car Trash Can',
        description: 'Keep your car tidy with a convenient, compact trash can.',
        price: 8.50,
        imageUrl: 'assets/car_trash_can.png',
        category: 'More',
      ),
      AutoPart(
        name: 'Car Air Freshener',
        description: 'Long-lasting air fresheners to keep your car smelling great.',
        price: 5.99,
        imageUrl: 'assets/air_freshener.png',
        category: 'More',
      )
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return allParts.where((part) => part.category == category).toList();
    });
  }
}

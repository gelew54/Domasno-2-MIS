import 'package:flutter/material.dart';

class AutoPartSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const AutoPartSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Search Auto Parts',
        hintText: 'Enter part name or description...',
        labelStyle: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blueAccent,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

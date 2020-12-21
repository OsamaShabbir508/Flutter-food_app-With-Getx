import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 14,
        margin: EdgeInsets.all(20),
        color: Colors.grey.shade300,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              hintText: 'Search here',
              suffixIcon: Container(
                // margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white70,
                ),
                child: Icon(Icons.search, color: Colors.black),
              )),
        ),
      ),
    );
  }
}

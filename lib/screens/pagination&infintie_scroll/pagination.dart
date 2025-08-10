import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  const Pagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,

      body: ListView.builder(
        itemCount: 60,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              'Products $index',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

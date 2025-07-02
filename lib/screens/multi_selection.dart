import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 100),

          Text(
            'What do you want to do today?',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),

          SizedBox(height: 30),

          Wrap(
            children: List.generate(20, (index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(4),
                ),

                child: Text('News', style: TextStyle(color: Colors.white)),
              );
            }),
          ),
        ],
      ),
    );
  }
}

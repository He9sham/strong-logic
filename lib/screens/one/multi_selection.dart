import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    'News',
    'Sports',
    'cooking',
    'flutter',
    'football',
    'backend',
    'tech',
    'lifeStyle',
    'music',
    'java',
  ];
  Set<String> emptyType = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),

            Text(
              'What do you want to do today?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            SizedBox(height: 30),
            // show all type
            Wrap(
              spacing: 6,
              runSpacing: 8,
              children: List.generate(types.length, (index) {
                final type = types[index];
                final isSelect = emptyType.contains(type);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!isSelect) {
                        emptyType.add(type);
                      } else {
                        emptyType.remove(type);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelect
                          ? Colors.blue.shade900
                          : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(4),
                    ),

                    child: Text(type, style: TextStyle(color: Colors.white)),
                  ),
                );
              }),
            ),

            SizedBox(height: 30),
            // selected type by user
            Wrap(
              spacing: 6,
              runSpacing: 8,

              children: List.generate(emptyType.length, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(4),
                  ),

                  child: Text(
                    emptyType.elementAt(index),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

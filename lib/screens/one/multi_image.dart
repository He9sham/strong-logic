import 'package:flutter/material.dart';

class MultiImage extends StatefulWidget {
  const MultiImage({super.key});

  @override
  State<MultiImage> createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  List<String> photos = [
    'assets/laptops/labtop1.png',
    'assets/laptops/labtop2.png',
    'assets/laptops/labtop3.png',
    'assets/laptops/labtop4.png',
  ];
  int selecteLaptop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdee00),

      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500,
            child: Image.asset(photos[selecteLaptop]),
          ),

          SizedBox(height: 30),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(photos.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selecteLaptop = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: selecteLaptop == index
                            ? Colors.blue
                            : Colors.white,
                      ),
                    ),
                    width: 90,
                    height: 90,
                    child: Image.asset(photos[index], fit: BoxFit.cover),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

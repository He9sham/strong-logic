import 'package:flutter/material.dart';
import 'package:strong_logic/screens/multi_image.dart';
import 'package:strong_logic/screens/multi_selection.dart';
import 'package:strong_logic/screens/single_selection.dart';
import 'package:strong_logic/screens/toggle.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController pageController = PageController();
  List<Widget> screens = [
    Toggle(),
    SingleSelection(),
    MultiImage(),
    MultiSelection(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (data) {
          setState(() {
            pageIndex = data;
          });
        },
        children: screens,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // back
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(pageIndex - 1);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      children: [Icon(Icons.arrow_back, color: Colors.black)],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(pageIndex + 1);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          'Next page',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

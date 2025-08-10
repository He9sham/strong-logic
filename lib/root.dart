import 'package:flutter/material.dart';
import 'package:strong_logic/screens/form_validation/form_validation.dart';
import 'package:strong_logic/screens/one/multi_image.dart';
import 'package:strong_logic/screens/one/multi_selection.dart';
import 'package:strong_logic/screens/one/single_selection.dart';
import 'package:strong_logic/screens/one/toggle.dart';
import 'package:strong_logic/screens/pagination&infintie_scroll/pagination.dart';
import 'package:strong_logic/screens/search&list_filtering/search_feature.dart';
import 'package:strong_logic/screens/upload_files/upload_file.dart';
import 'package:strong_logic/screens/upload_files/upload_image.dart';
import 'package:strong_logic/screens/upload_files/upload_multi_images.dart';
import 'package:strong_logic/screens/upload_files/upload_video.dart';

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
    UploadImage(),
    UploadMultiImages(),
    UploadVideo(),
    UploadFile(),
    SearchFeature(),
    FormValidation(),
    Pagination(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.7),
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

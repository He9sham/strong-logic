import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

List<Map> gifts = [
  {'name': 'cow', 'image': 'assets/animals/cow.png'},
  {'name': 'deer', 'image': 'assets/animals/deer.png'},
  {'name': 'giraffe', 'image': 'assets/animals/giraffe.png'},
  {'name': 'lion', 'image': 'assets/animals/lion.png'},
  {'name': 'pingeon', 'image': 'assets/animals/pingeon.png'},
  {'name': 'rat', 'image': 'assets/animals/rat.png'},
  {'name': 'tiger', 'image': 'assets/animals/tiger.png'},
  {'name': 'white tiger', 'image': 'assets/animals/white-tiger.png'},
];
int? selectIndex;

class _SingleSelectionState extends State<SingleSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 40,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black12,
                                  Colors.black26,
                                  Colors.black38,
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),

                  Column(
                    children: [
                      Image.asset(
                        width: 300,
                        height: selectIndex == index ? 120 : 100,
                        gifts[index]['image'],
                      ),
                      SizedBox(height: 10),
                      Text(
                        gifts[index]['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  selectIndex == index
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

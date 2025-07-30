import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/Hesham Logo.jpg'),
                ),
                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: isFollow
                          ? Colors.deepPurple.shade900
                          : Colors.white,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.checkmark_seal_fill
                            : CupertinoIcons.add,
                        color: isFollow ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFollow = !isFollow;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isFollow ? Icons.check : Icons.add,
                      color: isFollow ? Colors.white : Colors.purple,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hesham hemdan',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

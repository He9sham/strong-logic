import 'package:flutter/material.dart';

class UploadVideo extends StatelessWidget {
  const UploadVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900.withRed(9),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),

            // show video here
            Container(
              height: 170,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.withValues(alpha: 0.6),
              ),
            ),

            SizedBox(height: 40),
            Container(
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.green.withValues(alpha: 0.5),
              ),
              child: Center(
                child: Text(
                  'upload video',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

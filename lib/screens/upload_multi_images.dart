import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedMultiImage = [null, null, null];

  /// upload multi image 
  Future<void> uploadMultiImage() async {
    final selectedImage = await ImagePicker().pickMultiImage(limit: 3);

    for (int i = 0; i < 3; i++) {
      selectedMultiImage[i] = i < selectedImage.length
          ? selectedImage[i]
          : null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),

            // show there image
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedMultiImage.length, (index) {
                  final image = selectedMultiImage[index];
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.withValues(alpha: 0.6),
                    ),
                    child: image == null ? null : Image.file(File(image.path)),
                  );
                }),
              ),
            ),

            SizedBox(height: 50),

            // buttom upload image
            GestureDetector(
              onTap: uploadMultiImage,
              child: Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withValues(alpha: 0.9),
                ),
                child: Center(
                  child: Text(
                    'upload multi image',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // buttom remove image
            if (selectedMultiImage.any((image) => image != null))
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMultiImage = [null, null, null];
                  });
                },
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: Text(
                      'remove images',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

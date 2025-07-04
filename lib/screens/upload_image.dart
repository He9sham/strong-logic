import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? selectedImage;

  Future<void> uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade600,
      body: Column(
        children: [
          SizedBox(height: 150),
          // show selected image
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.withValues(alpha: 0.6),
              ),
              child: selectedImage == null
                  ? SizedBox.shrink()
                  : Image.file(File(selectedImage!.path)),
            ),
          ),
          SizedBox(height: 20),
          // selected image from gallery
          GestureDetector(
            onTap: uploadImage,
            child: Container(
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.withValues(alpha: 0.9),
              ),
              child: Center(
                child: Text(
                  selectedImage == null ? 'upload image' : 'change Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          // remove image
          if (selectedImage != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = null;
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
                    'remove image',
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
    );
  }
}

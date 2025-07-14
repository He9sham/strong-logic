import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? videoSelected;
  VideoPlayerController? controller;

  /// upload video
  Future<void> uploadVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      controller = VideoPlayerController.file(File(pickedVideo.path));
    }

    setState(() {
      videoSelected = pickedVideo;
    });

    controller!.play();

    controller!.setLooping(true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

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

              child: controller != null && controller!.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: AspectRatio(
                        aspectRatio: controller!.value.aspectRatio,
                        child: VideoPlayer(controller!),
                      ),
                    )
                  : null,
            ),

            SizedBox(height: 40),
            // button for chosse video
            GestureDetector(
              onTap: uploadVideo,
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? fileName;
  String? filepath;
  // upload file function
  Future<void> uploadFile() async {
    final pickerFiles = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'doc', 'jpg'],
    );

    if (pickerFiles != null && pickerFiles.files.single.name.isNotEmpty) {
      setState(() {
        fileName = pickerFiles.files.single.name;
        filepath = pickerFiles.files.single.path;
      });
    }
  }

  /// open file at my apk
  Future<void> openFile(String? path) async {
    if (path != null) {
      await OpenFile.open(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),

            Container(
              width: 350,
              height: 65,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
              ),

              child: Row(
                children: [
                  SvgPicture.asset(width: 60, 'assets/svgs/doc.svg'),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileName == null ? "Upload File" : "$fileName",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('pdf , docx , doc , jpg'),
                    ],
                  ),
                  Spacer(),
                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        // upload
                        PopupMenuItem(
                          onTap: uploadFile,
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.arrow_up_doc),
                              SizedBox(width: 5),
                              Text('upload'),
                            ],
                          ),
                        ),
                        // view
                        PopupMenuItem(
                          onTap: () => openFile(filepath),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.eye),
                              SizedBox(width: 5),
                              Text('View'),
                            ],
                          ),
                        ),
                        // change
                        PopupMenuItem(
                          onTap: filepath == null ? null : uploadFile,
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.refresh),
                              SizedBox(width: 5),
                              Text('change'),
                            ],
                          ),
                        ),
                        // delete
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              fileName = null;
                              filepath = null;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.delete, color: Colors.red),
                              SizedBox(width: 5),
                              Text(
                                'delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),
            // view my pdf
            if (filepath != null && filepath!.endsWith('pdf'))
              Container(
                decoration: BoxDecoration(color: Colors.transparent),
                width: width * 0.7,
                height: height * 0.5,
                child: SfPdfViewer.file(File(filepath!)),
              ),
          ],
        ),
      ),
    );
  }
}

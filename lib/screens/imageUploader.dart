import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hire_me/firebase/firebaseApi.dart';
import 'package:hire_me/widgets/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? basename(file!.path) : 'No File Selected Yet';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Upload Image'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                icon: Icons.attach_file,
                text: 'Select File',
                onClicked: selectFile,
              ),
              SizedBox(
                height: 8,
              ),
              Text(fileName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 48,
              ),
              ButtonWidget(
                  icon: Icons.cloud_upload_outlined,
                  text: 'Upload File',
                  onClicked: uploadFile),
              SizedBox(
                height: 48,
              ),
              task != null ? buildUploadStatus(task!) : Container()
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final path = result.files.single.path!;

      setState(() => file = File(path));
    }
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(2);

          return Text('$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
        } else {
          return Container();
        }
      });
}

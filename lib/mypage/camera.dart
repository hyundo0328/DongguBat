import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 찍은 이미지가 있다면 이미지를 보여줌
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                  )
                : Text('선택된 이미지가 없습니다.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              child: Text('사진 찍기'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getImage(
                    ImageSource.gallery); // This opens gallery to select image
              },
              child: Text('갤러리에서 가져오기'),
            ),
          ],
        ),
      ),
    );
  }
}

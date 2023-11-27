import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePreviewScreen extends StatelessWidget {
  final File imageFile;

  const ImagePreviewScreen({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선택한 사진'),
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Center(
        child: Image.file(
          imageFile,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}

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

  Future<void> selectImage() async {
    if (_image == null) {
      // If no image is selected, show an alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('선택된 사진이 없습니다.'),
            content: Text('사진을 먼저 선택해주세요!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewScreen(imageFile: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 사진 변경하기'),
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 44, 96, 68),
              ),
              child: Text('사진 찍기'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 44, 96, 68),
              ),
              child: Text('갤러리에서 가져오기'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: selectImage, //이거 지우고 DB로 가져가는 로직을 써주면 됩니다요~
              style: ElevatedButton.styleFrom(
                primary: _image != null
                    ? const Color.fromARGB(255, 44, 96, 68)
                    : Colors.grey, // Change button color here
              ),
              child: Text('선택한 사진으로 선택하기'),
            ),
          ],
        ),
      ),
    );
  }
}

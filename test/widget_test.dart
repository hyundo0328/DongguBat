import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FileDownloadButton extends StatefulWidget {
  final String fileUrl;
  final String fileName;

  FileDownloadButton({required this.fileUrl, required this.fileName});

  @override
  _FileDownloadButtonState createState() => _FileDownloadButtonState();
}

class _FileDownloadButtonState extends State<FileDownloadButton> {
  bool downloading = false;
  late String savePath;

  @override
  void initState() {
    super.initState();
    _initSavePath();
  }

  Future<void> _initSavePath() async {
    final directory = await getApplicationDocumentsDirectory();
    savePath = directory.path + '/' + widget.fileName;
  }

  Future<void> _startDownload() async {
    setState(() {
      downloading = true;
    });

    final response = await http.get(Uri.parse(widget.fileUrl));
    final file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      downloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: downloading ? null : _startDownload,
          child: Text(downloading ? 'Downloading...' : 'Download File'),
        ),
        if (downloading)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('File Download Example'),
      ),
      body: Center(
        child: FileDownloadButton(
          fileUrl: 'https://example.com/path/to/your/file',
          fileName: 'example_file.txt',
        ),
      ),
    ),
  ));
}

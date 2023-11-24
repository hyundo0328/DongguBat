import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  final TextEditingController _textControl1 = TextEditingController();
  final TextEditingController _textControl2 = TextEditingController();
  final TextEditingController _textControl3 = TextEditingController();
  final TextEditingController _textControl4 = TextEditingController();
  final TextEditingController _textControl5 = TextEditingController();
  final TextEditingController _textControl6 = TextEditingController();
  final TextEditingController _textControl7 = TextEditingController();
  final TextEditingController _textControl8 = TextEditingController();
  final TextEditingController _textControl9 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _textControl1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl3,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl4,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl5,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl6,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl7,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl8,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          controller: _textControl9,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(100, 0, 0, 0),
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.text,
        ),

        ElevatedButton(
          onPressed: () {},
          child: Text("클릭"),
        )
      ],
    );
  }
}

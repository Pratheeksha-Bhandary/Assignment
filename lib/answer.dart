import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final VoidCallback answerTap;

  Answer(
      {required this.answerText,
      required this.answerColor,
      required this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: answerColor,
            border: Border.all(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: Text(
            answerText,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class resultPage extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetFunction;

  const resultPage({required this.finalScore, required this.resetFunction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Color.fromARGB(255, 177, 75, 245),
        content: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Text(
                  "Score:" '$finalScore/3',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.all(10.0),
                    elevation: 10.0),
                child: Text("Restart",
                    style: TextStyle(fontSize: 15.0, color: Colors.black)),
                onPressed: resetFunction,
              ),
            ],
          ),
        ));
  }
}

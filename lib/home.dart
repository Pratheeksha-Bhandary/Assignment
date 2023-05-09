import 'package:assignment/answer.dart';
import 'package:assignment/result.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _questionNo = 0;
  int totalScore = 0;

  bool answerSelected = false;
  bool endQuiz = false;

  void questionAnswered(bool answerScore) {
    setState(() {
      answerSelected = true;
      if (answerScore) {
        totalScore++;
      }

      if (_questionNo + 1 == _questions.length) {
        endQuiz = true;
      }
    });
  }

  void nextquestion() {
    setState(() {
      _questionNo++;
      answerSelected = false;

      if (_questionNo >= _questions.length) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                resultPage(finalScore: totalScore, resetFunction: resetQuiz));
        _questionNo = 0;
        answerSelected = false;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      Navigator.of(context).pop();
      _questionNo = 0;
      totalScore = 0;
      endQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            //question box
            Container(
              width: 380.0,
              height: 150.0,
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.purple, Colors.blue]),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  _questions[_questionNo]['question'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),

            //Answers

            ...(_questions[_questionNo]['answers']
                    as List<Map<String, dynamic>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'],
                answerColor: answerSelected
                    ? answer['score']
                        ? Colors.green
                        : Colors.red
                    : Colors.transparent,
                answerTap: () {
                  if (answerSelected) {
                    return;
                  }

                  questionAnswered(answer['score']);
                },
              ),
            ),
            // next or submit button

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0, 40.0),
                  elevation: 15.0,
                ),
                onPressed: () {
                  if (!answerSelected) {
                    return;
                  }
                  nextquestion();
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'Which planet has the most moons?',
    'answers': [
      {'answerText': 'Saturn', 'score': true},
      {'answerText': 'Earth', 'score': false},
      {'answerText': 'Jupiter', 'score': false},
    ],
  },
  {
    'question': 'Which body part is the only one that is fully grown at birth?',
    'answers': [
      {'answerText': 'ears', 'score': false},
      {'answerText': 'lips', 'score': false},
      {'answerText': 'eyes', 'score': true},
    ],
  },
  {
    'question': 'Which animal can be seen on the Porsche logo?',
    'answers': [
      {'answerText': 'Camel', 'score': false},
      {'answerText': 'Zebra', 'score': false},
      {'answerText': 'Horse', 'score': true},
    ],
  },
];

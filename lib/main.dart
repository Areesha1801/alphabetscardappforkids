import 'package:alphabetscardappforkids/small_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'alphabets_brain.dart';
import 'dart:async';

AlphabetBrain alphabetBrain = AlphabetBrain();

class CapitalApp extends StatelessWidget {
  const CapitalApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Capital Alphabet'),
          actions: [
            IconButton(
              icon: Image.asset('images/img1.jpg'),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Row(
          children: [
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Text(
                      'Areesha Asif',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Capital A-Z"),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const CapitalApp()));
                    },
                  ),
                  ListTile(
                    title: const Text("Small a-z"),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SmallApp()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CapitalAppPage(),
          ),
        ),
      ),
    );
  }
}

class CapitalAppPage extends StatefulWidget {
  const CapitalAppPage({Key key}) : super(key: key);

  @override
  _CapitalAppState createState() => _CapitalAppState();
}

class _CapitalAppState extends State<CapitalAppPage> {
  int _counter = 10;
  Timer _timer;
  int z = 0;
  void _startTimer() {
    _counter = 5;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else if (_counter == 0) {
          alphabetBrain.nextQuestion();
          _counter = 5;
        } else if (alphabetBrain.endCheck() == 25 && _counter == 0) {
          if (alphabetBrain.isFinished() == true) {
            _showMyDialog(); //Alert dialogue box
            alphabetBrain.reset();
          }
        } else {
          _timer.cancel();
        }
      });
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lesson Finished'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Hurrah!!! You have Completed Your Lesson'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = alphabetBrain.getCorrectAnswer();
    setState(() {
      if (alphabetBrain.isFinished() == true) {
        _timer.cancel();
        _showMyDialog();
        alphabetBrain.reset();
      } else {
        if (userPickedAnswer == correctAnswer) {
          alphabetBrain.nextQuestion();
        } else {
          alphabetBrain.previousQuestion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '$_counter\n ',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black87,
                    ),
                  ),
                  const Text("\n"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    alphabetBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 100.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'Forward',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                _startTimer();
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'Backward',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _startTimer();
                checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

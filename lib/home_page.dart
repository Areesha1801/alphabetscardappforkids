import 'package:alphabetscardappforkids/small_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Home Page'),
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
              children: const <Widget>[
                DrawerHeader(
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
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: HomePagePage(),
        ),
      ),
    );
  }
}

class HomePagePage extends StatelessWidget {
  const HomePagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 10.0, height: 100.0),
            const Text(
              'Select Your Choice',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.teal,
              ),
            ),
            const SizedBox(width: 15.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 35.0,
                color: Colors.black87,
              ),
              child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    RotateAnimatedText('Of '),
                    RotateAnimatedText('Lesson'),
                  ]),
            ),
          ],
        ),
        FlatButton(
          textColor: Colors.white,
          color: Colors.green,
          child: const Text(
            'Capital A-Z',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    const CapitalApp())); //The user picked true.
          },
        ),
        FlatButton(
          textColor: Colors.white,
          color: Colors.green,
          child: const Text(
            'Small a-z',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    const SmallApp())); //The user picked true.
          },
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

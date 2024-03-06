import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Guess());
}

class Guess extends StatefulWidget {
  const Guess({super.key});

  @override
  State<Guess> createState() => _GuessState();
}

class _GuessState extends State<Guess> {
  List<String> pics = [
    'assets/one.png',
    'assets/two.png',
    'assets/three.png',
    'assets/four.png',
    'assets/five.png',
    'assets/six.png',
  ];
  Random rand = Random(0);
  String image = 'assets/one.png';
  String image2 = 'assets/one.png';
  String text = 'Begin';
  String title = 'Guess';

  void check() {
    if (image == image2) {
      text = 'Congratulations';
    } else {
      text = 'Try Again';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffB10F2E),
        appBar: AppBar(
          backgroundColor: const Color(0xff570000),
          shape: const CircleBorder(
              side: BorderSide(
                  width: 25,
                  color: Color(0xff570000),
                  strokeAlign: BorderSide.strokeAlignOutside),
              eccentricity: 1),
          title: TextButton(
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              setState(() {
                title = 'Made By Ahmed';
              });
              Timer(const Duration(seconds: 3), () {
                setState(() {
                  title = 'Guess';
                });
              });
            },
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: SizedBox(
                        height: 150,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                image = pics[rand.nextInt(6)];
                                check();
                              });
                            },
                            child: Image.asset(image)))),
                Expanded(
                    child: SizedBox(
                        height: 150,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                image2 = pics[rand.nextInt(6)];
                                check();
                              });
                            },
                            child: Image.asset(image2)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

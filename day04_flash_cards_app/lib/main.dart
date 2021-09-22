import 'package:day04_flash_cards_app/flashcard.dart';
import 'package:day04_flash_cards_app/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashcards = [
    FlashCard(question: "Ausseriridische", answer: "Alien"),
    FlashCard(question: "Guten Tag", answer: "Good Day"),
    FlashCard(question: "Los geht's", answer: "Let's Go"),
    FlashCard(question: "Danke", answer: "Thanks")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                front: FlashCardView(
                  text: _flashcards[_currentIndex].question,
                ),
                back: FlashCardView(
                  text: _flashcards[_currentIndex].answer,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev')),
                OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'))
              ],
            )
          ]))),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex < _flashcards.length - 1
          ? _currentIndex++
          : _currentIndex = 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex > 0
          ? _currentIndex--
          : _currentIndex = _flashcards.length - 1;
    });
  }
}

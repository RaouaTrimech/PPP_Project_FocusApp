import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/Games_Assets/MemoGame_Assets/hidden.png";
  List<String> cards_list = [
    "assets/Games_Assets/MemoGame_Assets/circle.png",
    "assets/Games_Assets/MemoGame_Assets/triangle.png",
    "assets/Games_Assets/MemoGame_Assets/circle.png",
    "assets/Games_Assets/MemoGame_Assets/heart.png",
    "assets/Games_Assets/MemoGame_Assets/star.png",
    "assets/Games_Assets/MemoGame_Assets/triangle.png",
    "assets/Games_Assets/MemoGame_Assets/star.png",
    "assets/Games_Assets/MemoGame_Assets/heart.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }

  void resetGame() {
    cards_list.shuffle();
  }
}

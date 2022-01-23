import 'dart:math';
import 'package:flutter/material.dart';
class DiceModel with ChangeNotifier {
  int diceOne = 1;
  int col=0;

  int get diceOneCount => diceOne;

  void generateDiceOne() {
    diceOne = Random().nextInt(6) + 1;
    print("diceOne: $diceOne");
    notifyListeners();
  }

  void colorPicker() {
    col= (col+1)%4;
    print("color :$col");
    notifyListeners();
  }
}
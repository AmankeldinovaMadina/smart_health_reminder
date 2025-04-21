import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _points = 150;
  int _level = 1;

  int get points => _points;
  int get level => _level;

  List<Map<String, dynamic>> get leaderboard => [
    {'name': 'Dias', 'score': '2,569 QP'},
    {'name': 'Madina', 'score': '2,569 QP'},
    {'name': 'Madi', 'score': '2,569 QP'},
  ];

  void addPoints(int value) {
    _points += value;
    if (_points >= 300) {
      _level++;
      _points = 0;
    }
    notifyListeners();
  }
}

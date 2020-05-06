import 'package:flutter/foundation.dart';

class HighscoreModel {
  final double points;
  final String playerName;

  HighscoreModel({@required playerName, @required points})
      : this.playerName = playerName,
        this.points = points;
}

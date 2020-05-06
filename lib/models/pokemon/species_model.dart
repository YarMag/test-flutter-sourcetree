import 'package:flutter/foundation.dart';
import 'package:start_app/models/pokemon/shape_model.dart';

class SpeciesModel {
  final int id;
  final String name;
  final double genderRate;
  final double captureRate;
  final String colorId;
  final ShapeModel shape;

  SpeciesModel(
      {@required this.id,
      @required this.name,
      @required this.genderRate,
      @required this.captureRate,
      @required this.colorId,
      @required this.shape});
}

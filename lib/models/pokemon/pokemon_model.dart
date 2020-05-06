import 'package:flutter/foundation.dart';
import 'package:start_app/models/pokemon/species_model.dart';
import 'package:start_app/models/pokemon/type_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final double height;
  final double weight;
  final SpeciesModel species;
  final List<TypeModel> types;

  PokemonModel(
      {@required this.id,
      @required this.name,
      this.height,
      this.weight,
      this.species,
      this.types});

  @override
  bool operator ==(other) {
    return this.id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

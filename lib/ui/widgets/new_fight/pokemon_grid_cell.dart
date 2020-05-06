import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/ui/constants/pokemon_images.dart';
import 'package:start_app/ui/constants/palette.dart';

class PokemonGridCell extends StatefulWidget {
  final PokemonModel _pokemon;

  PokemonGridCell({@required PokemonModel pokemon}) : this._pokemon = pokemon;

  @override
  State<StatefulWidget> createState() => _PokemonGridCellState();
}

class _PokemonGridCellState extends State<PokemonGridCell> {
  INewFightBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          _bloc.inSelectedPokemon.add(widget._pokemon);
      },
      child: Container(
        width: 100,
        height: 100,
        child: FittedBox(
          child: PokemonImages.forPokemon(widget._pokemon),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

}

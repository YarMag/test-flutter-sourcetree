
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/ui/constants/palette.dart';
import 'package:start_app/ui/widgets/new_fight/pokemon_grid_cell.dart';

class PokemonsGrid extends StatefulWidget {

  final List<PokemonModel> _pokemons;

  PokemonsGrid(this._pokemons);

  @override
  State<StatefulWidget> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonsGrid> {
  INewFightBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 400,
        child: StreamBuilder(
          stream: _bloc.outSelectedPokemon,
          builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.9),
              children:
              widget._pokemons.map((PokemonModel p) =>
                  Container(
                    child: PokemonGridCell(
                      pokemon: p,
                    ),
                    decoration: (_bloc.getActiveParticipantPokemon() == p)
                        ? BoxDecoration(
                        border: Border.all(width: 1, color: Palette.secondarySelection))
                        : null,
                  )
                  ,
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
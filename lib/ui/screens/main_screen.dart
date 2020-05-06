import 'package:flutter/cupertino.dart';
import 'package:start_app/di/builders.dart';
import 'package:start_app/ui/constants/pokemon_images.dart';

class MainScreen extends StatelessWidget {
  final NewFightScreenBuilder _newFightScreenBuilder;
  final HighscoresScreenBuilder _highscoresScreenBuilder;
  final PokedexScreenBuilder _pokedexScreenBuilder;

  MainScreen(
      {@required newFightScreenBuilder,
      @required highscoresScreenBuilder,
      @required pokedexScreenBuilder})
      : this._newFightScreenBuilder = newFightScreenBuilder,
        this._highscoresScreenBuilder = highscoresScreenBuilder,
        this._pokedexScreenBuilder = pokedexScreenBuilder;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        primary: false,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logo(),
              _upperImages(),
              CupertinoButton(
                child: Text("New fight"),
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            _newFightScreenBuilder())),
              ),
              CupertinoButton(
                child: Text("Pokedex"),
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            _pokedexScreenBuilder())),
              ),
              CupertinoButton(
                child: Text("Highscores"),
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            _highscoresScreenBuilder())),
              ),
              CupertinoButton(
                child: Text("Settings"),
                onPressed: () => print("Not implemented yet"),
              ),
              _lowerImages(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _wrappedImage(PokemonImages.pokemonLogo(), width: 340, height: 180)
      ],
    );
  }

  Widget _upperImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _wrappedImage(PokemonImages.bulbasaur()),
        _wrappedImage(PokemonImages.pickachu())
      ],
    );
  }

  Widget _lowerImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _wrappedImage(PokemonImages.charmander()),
        _wrappedImage(PokemonImages.squirtle())
      ],
    );
  }

  Widget _wrappedImage(Image img, {double width = 180, double height = 180}) =>
      Container(
        width: width,
        height: height,
        child: FittedBox(
          child: img,
          fit: BoxFit.fill,
        ),
      );
}

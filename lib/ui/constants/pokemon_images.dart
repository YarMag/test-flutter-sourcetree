
import 'package:flutter/cupertino.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokemonImages {
  static Image pokemonLogo() => Image.asset("assets/pokemon_logo.png");

  static Image bulbasaur() => Image.asset("assets/pokemon_sprites/bulbasaur.png");

  static Image charmander() => Image.asset("assets/pokemon_sprites/charmander.png");

  static Image squirtle() => Image.asset("assets/pokemon_sprites/squirtle.png");

  static Image pickachu() => Image.asset("assets/pokemon_sprites/pickachu.png");

  static Image sandslash() => Image.asset("assets/pokemon_sprites/sandslash.png");

  static Image onix() => Image.asset("assets/pokemon_sprites/onix.png");

  static Image starmie() => Image.asset("assets/pokemon_sprites/starmie.png");

  static Image kadabra() => Image.asset("assets/pokemon_sprites/kadabra.png");

  static Image psyduck() => Image.asset("assets/pokemon_sprites/psyduck.png");

  static Image mewto() => Image.asset("assets/pokemon_sprites/mewto.png");

  static Image haunter() => Image.asset("assets/pokemon_sprites/haunter.png");

  static Image geodude() => Image.asset("assets/pokemon_sprites/geodude.png");

  static Image gyarados() => Image.asset("assets/pokemon_sprites/gyarados.png");

  static Image forPokemon(PokemonModel pokemon) {
    switch (pokemon.name) {
      case "bulbasaur":
        return bulbasaur();
      case "charmander":
        return charmander();
      case "squirtle":
        return squirtle();
      case "pickachu":
        return pickachu();
      case "sandslash":
        return sandslash();
      case "onix":
        return onix();
      case "starmie":
        return starmie();
      case "kadabra":
        return kadabra();
      case "psyduck":
        return psyduck();
      case "mewto":
        return mewto();
      case "haunter":
        return haunter();
      case "geodude":
        return geodude();
      case "gyarados":
        return gyarados();
      default:
        return null;
    }
  }
}
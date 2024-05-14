part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  final Map<int, String> pokemons;

  const PokemonState({
    this.pokemons = const {},
  });

  @override
  List<Object> get props => [
        pokemons,
      ];

  PokemonState copyWith({
    Map<int, String>? pokemons,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
    );
  }
}

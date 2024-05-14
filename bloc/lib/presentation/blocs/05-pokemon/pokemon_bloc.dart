import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

typedef PokemonNameCallBack = Future<String> Function(int id);

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonNameCallBack _fetchPokemonName;

  PokemonBloc({
    required PokemonNameCallBack fetchPokemonName,
  }) : _fetchPokemonName = fetchPokemonName,
  super(const PokemonState()) {
    on<PokemonAdded>(_handlerPokemonAdded);
  }

  void _handlerPokemonAdded(event, emit) {
    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.name;

    emit(state.copyWith(pokemons: newPokemons));
  }

  Future<String> fetchPokemon(int id) async {
    try {
      if (state.pokemons.containsKey(id)) {
        return state.pokemons[id]!;
      }

      final pokemonName = await _fetchPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon');
    }
  }
}

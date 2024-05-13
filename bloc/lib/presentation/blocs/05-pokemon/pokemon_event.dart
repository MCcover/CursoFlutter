part of 'pokemon_bloc.dart';

class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

final class PokemonAdded extends PokemonEvent {
  final int id;
  final String name;

  const PokemonAdded(this.id, this.name);

  @override
  List<Object> get props => [
        id,
        name,
      ];
}

import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(
          GuestsState(
            guests: [
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: null,
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: DateTime.now(),
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: null,
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: DateTime.now(),
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: DateTime.now(),
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: null,
              ),
              Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: null,
              ),
            ],
          ),
        ) {
    // on<SetAllGuestEvent>((event, emit) {
    //   emit(state.copyWith(currentFilter: GuestFilter.all));
    // });

    // on<SetInvitedGuestEvent>((event, emit) {
    //   emit(state.copyWith(currentFilter: GuestFilter.invited));
    // });

    // on<SetNoInvitedGuestEvent>((event, emit) {
    //   emit(state.copyWith(currentFilter: GuestFilter.noInvited));
    // });

    on<SetCustomGuestEvent>((event, emit) {
      emit(state.copyWith(currentFilter: event.newFilter));
    });

    on<AddGuest>(_handleAddGuest);

    on<ToggleGuest>(_handlerToggleGuest);
  }

  void changeFilter(GuestFilter newfilter) {
    // switch (newfilter) {
    //   case GuestFilter.all:
    //     add(SetAllGuestEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedGuestEvent());
    //     break;
    //   case GuestFilter.noInvited:
    //     add(SetNoInvitedGuestEvent());
    //     break;
    // }

    add(SetCustomGuestEvent(newfilter));
  }

  void addGuest(String description) {
    add(AddGuest(description));
  }

  void toggleGuest(String id) {
    add(ToggleGuest(id));
  }

  void _handleAddGuest(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: event.description,
      completedAt: null,
    );

    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _handlerToggleGuest(ToggleGuest event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((e) {
      if (e.id != event.id) {
        return e;
      }

      return e.copyWith(
        completedAt: e.done ? null : DateTime.now(),
      );
    }).toList();

    emit(state.copyWith(guests: newGuests));
  }
}

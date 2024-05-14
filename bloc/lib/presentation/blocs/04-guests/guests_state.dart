part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestsState extends Equatable {
  final GuestFilter currentFilter;
  final List<Todo> guests;

  const GuestsState({
    this.currentFilter = GuestFilter.all,
    this.guests = const [],
  });

  int get howManyGuests => guests.length;
  int get howManyFilteredGuests => filteredGuest.length;

  List<Todo> get filteredGuest {
    switch (currentFilter) {
      case GuestFilter.all:
        return guests;
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
    }
  }

  @override
  List<Object> get props => [
        currentFilter,
        guests,
      ];

  GuestsState copyWith({
    GuestFilter? currentFilter,
    List<Todo>? guests,
  }) {
    return GuestsState(
      currentFilter: currentFilter ?? this.currentFilter,
      guests: guests ?? this.guests,
    );
  }
}

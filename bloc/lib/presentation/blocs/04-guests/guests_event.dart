part of 'guests_bloc.dart';

class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

// final class SetAllGuestEvent extends GuestsEvent {}

// final class SetInvitedGuestEvent extends GuestsEvent {}

// final class SetNoInvitedGuestEvent extends GuestsEvent {}

final class SetCustomGuestEvent extends GuestsEvent {
  final GuestFilter newFilter;

  const SetCustomGuestEvent(this.newFilter);
}

final class AddGuest extends GuestsEvent {
  final String description;

  const AddGuest(this.description);
}


final class ToggleGuest extends GuestsEvent {
  final String id;

  const ToggleGuest(this.id);
}

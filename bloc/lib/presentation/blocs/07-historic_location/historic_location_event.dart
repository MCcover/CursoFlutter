part of 'historic_location_bloc.dart';

class HistoricLocationEvent extends Equatable {
  const HistoricLocationEvent();

  @override
  List<Object> get props => [];
}

class NewLocationEvent extends HistoricLocationEvent {
  final (double lat, double lng) location;

  const NewLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}

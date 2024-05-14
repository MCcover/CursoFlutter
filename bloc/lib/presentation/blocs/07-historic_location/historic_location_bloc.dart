import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocationEvent>(_handlerNewLocation);
  }

  void onNewUserLocation((double lat, double lng) location) {
    add(NewLocationEvent(location));
  }

  void _handlerNewLocation(
      NewLocationEvent event, Emitter<HistoricLocationState> emit) {
    emit(
      state.copyWith(
        locations: [...state.locations, event.location],
      ),
    );
  }
}

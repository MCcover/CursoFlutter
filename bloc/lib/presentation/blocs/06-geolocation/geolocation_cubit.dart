import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

typedef OnNewUserLocationCallback = void Function(
    (double lat, double lng) location);

class GeolocationCubit extends Cubit<GeolocationState> {
  final OnNewUserLocationCallback? onNewUserLocationCallback;

  GeolocationCubit({this.onNewUserLocationCallback})
      : super(const GeolocationState());

  Future<void> checkStatus() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permissionGranted = await Geolocator.checkPermission();

    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      serviceEnabled: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.always ||
          permissionGranted == LocationPermission.whileInUse,
    ));
  }

  Future<void> watchUserLocation() async {
    await checkStatus();

    if (!state.permissionGranted || !state.serviceEnabled) {
      return;
    }

    const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 15);

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((event) {
      final newLocation = (event.latitude, event.longitude);
      emit(state.copyWith(location: newLocation));

      onNewUserLocationCallback?.call(newLocation);
    });
  }
}

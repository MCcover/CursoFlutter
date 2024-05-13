import 'package:blocs_app/presentation/blocs/07-historic_location/historic_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final geolocationCubit = context.watch<GeolocationCubit>();
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${locationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: locationState.howManyLocations,
        itemBuilder: (BuildContext context, int index) {
          final location = locationState.locations[index];
          final (lat, lng) = location;

          return ListTile(
            title: Text('Lat: $lat Lng: $lng'),
          );
        },
      ),
    );
  }
}

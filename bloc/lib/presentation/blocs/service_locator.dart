import 'package:blocs_app/config/helpers/pokemon_information.dart';
import 'package:blocs_app/config/router/app_router.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-counter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs/04-guests/guests_bloc.dart';
import 'package:blocs_app/presentation/blocs/05-pokemon/pokemon_bloc.dart';
import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:blocs_app/presentation/blocs/07-historic_location/historic_location_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());

  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc(
    fetchPokemonName: PokemonInformation.getPokemonName,
  ));

  getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(
    GeolocationCubit(
      onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
    )..watchUserLocation(),
  );
}

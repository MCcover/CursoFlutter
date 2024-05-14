import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/config/helpers/scrollBehavior/scroll_behavior.dart';
import 'package:blocs_app/config/helpers/windowsSize/window_size.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-counter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs/04-guests/guests_bloc.dart';
import 'package:blocs_app/presentation/blocs/05-pokemon/pokemon_bloc.dart';
import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:blocs_app/presentation/blocs/07-historic_location/historic_location_bloc.dart';
import 'package:blocs_app/presentation/blocs/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  if (kDebugMode) {
    setWindowSize(height: 700, width: 400);
  }

  serviceLocatorInit();

  runApp(const BlocksProviders());
}

class BlocksProviders extends StatelessWidget {
  const BlocksProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UsernameCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<RouterSimpleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GuestsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PokemonBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GeolocationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HistoricLocationBloc>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}

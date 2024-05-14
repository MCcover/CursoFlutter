import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-counter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: themeCubit.state.isDarkMode
                ? const Icon(Icons.light_mode_outlined, size: 100)
                : const Icon(Icons.dark_mode_outlined, size: 100),
            onPressed: () {
              themeCubit.toggleTheme();
            },
          ),
          BlocBuilder<UsernameCubit, String>(
            builder: (context, state) {
              return Text(state, style: const TextStyle(fontSize: 25));
            },
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(state.toString(),
                    style: const TextStyle(fontSize: 100));
              },
            ),
            onPressed: () {
              context.read<CounterCubit>().incrementBy(1);
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

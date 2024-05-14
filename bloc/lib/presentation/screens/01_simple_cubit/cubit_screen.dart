import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usernameCubit = context.watch<UsernamCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          // buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Text(state);
          },
        )
        // Text(usernameCubit.state),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UsernameCubit>().setUsername(RandomGenerator.getRandomName()),//usernameCubit.setUsername(RandomGenerator.getRandomName()),
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}

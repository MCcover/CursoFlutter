import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/blocs/counter_cubit/counter_cubit.dart';

class CubitPage extends StatelessWidget {
  static const name = 'cubit-page';

  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter Strike: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () => {
              context.read<CounterCubit>().reset(),
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 80),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              increaseCounterBy(context, 3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              increaseCounterBy(context, 1);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}

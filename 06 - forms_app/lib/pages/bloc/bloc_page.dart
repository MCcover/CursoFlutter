import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterPage extends StatelessWidget {
  static const name = 'bloc-page';

  const BlocCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocView(),
    );
  }
}

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter Strike: ${(context.read<CounterBloc>().state.transactionCount)}'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().reset(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
          child: context.select(
        (CounterBloc counterBloc) => Text(
          counterBloc.state.counter.toString(),
          style: const TextStyle(fontSize: 80),
        ),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy(context, 1),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}

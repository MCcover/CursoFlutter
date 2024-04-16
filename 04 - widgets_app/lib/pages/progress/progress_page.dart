import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InfiniteProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              _ControlledProgressIndicator()
            ],
          ),
        ));
  }
}

class InfiniteProgressIndicator extends StatelessWidget {
  const InfiniteProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Infinite progress indicator'),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.black45,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(100),
                minHeight: 10,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(
          milliseconds: 300,
        ),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        return Column(
          children: [
            const Text('Progress indicator controlado'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: snapshot.data ?? 0,
                  strokeWidth: 10,
                  backgroundColor: Colors.black45,
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: snapshot.data ?? 0,
                    borderRadius: BorderRadius.circular(100),
                    minHeight: 10,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChatAsync = ref.watch(usersInChatProvider);

    if (usersInChatAsync.isLoading) {
      return const CircularProgressIndicator();
    }

    if (usersInChatAsync.hasError) {
      return Center(
        child: Text(usersInChatAsync.error.toString()),
      );
    }

    var users = usersInChatAsync.value!;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]),
        );
      },
    );
  }
}

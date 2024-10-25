import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
import 'package:push_app/domain/push_message.dart';

class DetailsPage extends StatelessWidget {
  final String messageId;

  static String name = "details-page";

  const DetailsPage({
    super.key,
    required this.messageId,
  });

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context.watch<NotificationsBloc>().getMessageById(messageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles Push"),
      ),
      body: _DetialsView(
        message: message,
      ),
    );
  }
}

class _DetialsView extends StatelessWidget {
  final PushMessage? message;
  const _DetialsView({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return const Center(
        child: Text("No existe la notificación"),
      );
    }

    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          if (message!.imageUrl != null) Image.network(message!.imageUrl!),
          const SizedBox(height: 30),
          Text(
            message!.title,
            style: textStyles.titleMedium,
          ),
          Text(message!.body),
          const Divider(),
          Text(message!.data == null || message!.data!.isEmpty ? "" : message!.data.toString()),
        ],
      ),
    );
  }
}

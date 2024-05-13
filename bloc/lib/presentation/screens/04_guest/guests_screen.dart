import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/blocs/04-guests/guests_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<GuestsBloc>().addGuest(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestBlock = context.watch<GuestsBloc>();

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invitados')),
            ButtonSegment(
                value: GuestFilter.noInvited, icon: Text('No invitados')),
          ],
          selected: <GuestFilter>{guestBlock.state.currentFilter},
          onSelectionChanged: (value) {
            guestBlock.changeFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestBlock.state.howManyFilteredGuests,
            itemBuilder: (context, index) {
              var guest = guestBlock.state.filteredGuest[index];

              return SwitchListTile(
                title: Text(guest.description),
                value: guest.done,
                onChanged: (value) {
                  guestBlock.toggleGuest(guest.id);
                },
              );
            },
          ),
        )
      ],
    );
  }
}

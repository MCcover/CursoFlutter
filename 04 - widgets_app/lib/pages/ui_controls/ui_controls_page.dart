import 'package:flutter/material.dart';

class UiControlsPage extends StatelessWidget {
  const UiControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {
  car,
  boat,
  plane,
  submarine,
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDiner = false;

  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
        ),
        ExpansionTile(
          title: const Text("Vehiculo de transporte"),
          subtitle:
              Text("Vehiculo seleccionado: ${selectedTransportation.name}"),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar en auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar en avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Quiere Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Quiere Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Quiere Cena?'),
          value: wantsDiner,
          onChanged: (value) {
            setState(() {
              wantsDiner = !wantsDiner;
            });
          },
        ),
      ],
    );
  }
}

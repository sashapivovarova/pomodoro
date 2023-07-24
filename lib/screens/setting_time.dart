import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class SettingTime extends StatefulWidget {
  const SettingTime({super.key});

  @override
  State<SettingTime> createState() => _SettingTimeState();
}

class _SettingTimeState extends State<SettingTime> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: <Widget>[
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        buildNumberRow(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildNumberRow(BuildContext context) {
    int time = 25;
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          child: ElevatedButton(
            child: const Text('Number Picker'),
            onPressed: () => showMaterialNumberPicker(
              context: context,
              title: 'Pick Your Time',
              maxNumber: 60,
              minNumber: 5,
              selectedNumber: time,
              onChanged: (value) => setState(() => time = value),
            ),
          ),
        ),
      ],
    );
  }
}

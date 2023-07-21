import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class SettingTime extends StatefulWidget {
  const SettingTime({super.key});

  @override
  State<SettingTime> createState() => _SettingTimeState();
}

class _SettingTimeState extends State<SettingTime> {
  int time = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showMaterialNumberPicker(
          context: context,
          title: 'Pick Your Time',
          maxNumber: 60,
          minNumber: 5,
          selectedNumber: time,
          onChanged: (value) => setState(() => time = value),
        )
      ],
    );
  }
}

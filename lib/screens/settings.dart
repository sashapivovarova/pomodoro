import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Settings'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Edit Timer'),
        ),
      ),
    );
  }
}

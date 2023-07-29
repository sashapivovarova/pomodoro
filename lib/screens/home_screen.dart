import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initialTime = 1500;
  int totalSeconds = initialTime;
  bool isRunning = false;
  bool isPushed = false;
  int totalPomodoros = 0;
  int time = 25;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = initialTime;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void setTime() {
    if (isRunning) {
      timer.cancel();
      setState(() {
        isRunning = false;
        totalSeconds = time * 60;
      });
    } else {
      setState(() {
        totalSeconds = time * 60;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void reset() {
    Navigator.pop(context, 'OK');
    if (isRunning) {
      timer.cancel();
      setState(() {
        isRunning = false;
        totalPomodoros = 0;
        totalSeconds = initialTime;
      });
    } else {
      setState(() {
        totalPomodoros = 0;
        totalSeconds = initialTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          IconButton(
            iconSize: 120,
            color: Theme.of(context).cardColor,
            onPressed: isRunning ? onPausePressed : onStartPressed,
            icon: Icon(
              isRunning
                  ? Icons.pause_circle_outline_rounded
                  : Icons.play_circle_outline_rounded,
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pomodorosText(context),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 115,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              resetButton(context),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                          color: Color(
                            0xff4b2238,
                          ),
                        ),
                        SizedBox(
                          width: 115,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              settingButton(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text pomodorosText(BuildContext context) {
    return Text(
      'Pomodoros $totalPomodoros',
      style: TextStyle(
        color: Theme.of(context).cardColor,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  TextButton resetButton(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            '',
          ),
          content: Text(
            'Are you sure to reset the timer?',
            style: TextStyle(
              color: Theme.of(context).textTheme.displayLarge!.color,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                reset();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          backgroundColor: Theme.of(context).cardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
        ),
      ),
      child: Text(
        'Reset',
        style: TextStyle(
          color: Theme.of(context).textTheme.displayLarge!.color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  TextButton settingButton(BuildContext context) {
    return TextButton(
      onPressed: () => showMaterialNumberPicker(
        headerColor: const Color(0xfff88987),
        headerTextColor: Colors.white,
        backgroundColor: const Color(0xfff4eddb),
        buttonTextColor: const Color(0xff4b2238),
        context: context,
        title: 'Set Your Timer',
        maxNumber: 55,
        minNumber: 5,
        step: 5,
        selectedNumber: time,
        onChanged: (value) => setState(() => time = value),
        onConfirmed: setTime,
      ),
      child: Text(
        'Setting',
        style: TextStyle(
          color: Theme.of(context).textTheme.displayLarge!.color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

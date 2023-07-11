import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pomodoro/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinuates = 1500;
  int totalSeconds = twentyFiveMinuates;
  bool isRunning = false;
  bool isPushed = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinuates;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
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
    timer.cancel();
    setState(() {
      isRunning = false;
      totalPomodoros = 0;
      totalSeconds = twentyFiveMinuates;
    });
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
          Flexible(
            flex: 1,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline_rounded
                      : Icons.play_circle_outline_rounded,
                ),
              ),
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
                              Text(
                                'Pomodoros',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '$totalPomodoros',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                              TextButton(
                                onPressed: reset,
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                                child: Divider(
                                  thickness: 1,
                                  color: Color(
                                    0xff4b2238,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Settings()),
                                  );
                                },
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
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
}

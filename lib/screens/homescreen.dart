import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/widgets/timecard.dart';
import 'package:pomodoro_challenge/widgets/durationcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const setminutes = 1500;
  static const restminutes = 300;
  int totalSeconds = setminutes;
  bool isRunning = false;
  bool isResting = false;
  int userround = 0;
  int usergoal = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        userround = userround + 1;
        isRunning = false;
        totalSeconds = setminutes;
      });
      timer.cancel();
      if (userround == 4) restingTime;
    } else {
      setState(
        () {
          totalSeconds = totalSeconds - 1;
        },
      );
    }
  }

  void restingTime() {}

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(
      () {
        isRunning = true;
      },
    );
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      // isResting = false;
    });
  }

  void reSet() {
    timer.cancel();
    setState(() {
      isRunning = false;
      isResting = false;
      totalSeconds = setminutes;
      userround = 0;
      usergoal = 0;
    });
  }

  void nothing() {}

  String formatMinute(int seconds) {
    var duration = Duration(seconds: seconds);
    // print(duration.toString());
    // print(duration.toString().split("."));
    // print(duration.toString().split(".").first);
    // print(duration.toString().split(".").first.substring(2,7));
    return duration.toString().split(".").first.substring(2, 7);
  }

  String formatSecond(int seconds) {
    var duration = Duration(seconds: seconds);
    // print(duration.toString());
    // print(duration.toString().split("."));
    // print(duration.toString().split(".").first);
    // print(duration.toString().split(".").first.substring(2,7));
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'POMOTIMER',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [
                isResting
                    ? Column(
                        children: [
                          const SizedBox(height: 17),
                          Text(
                            'REST TIME',
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30)
                        ],
                      )
                    : const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TimeCard(),
                    Transform.translate(
                      offset: const Offset(0, 30),
                      child: const Text(
                        ':',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          // color: Theme.of(context).textTheme.displayLarge!.color,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    const TimeCard(),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                alignment: Alignment.topCenter,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DurationCard(
                      totalminutes: 15,
                    ),
                    DurationCard(
                      totalminutes: 20,
                    ),
                    DurationCard(
                      totalminutes: 25,
                    ),
                    DurationCard(
                      totalminutes: 30,
                    ),
                    DurationCard(
                      totalminutes: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 100,
                  color: Theme.of(context).colorScheme.onBackground,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: const Icon(
                    Icons.play_circle_outline_outlined,
                  ),
                ),
                IconButton(
                  iconSize: 100,
                  color: isRunning
                      ? const Color.fromRGBO(234, 228, 196, 0.5)
                      : Theme.of(context).colorScheme.onBackground,
                  onPressed: isRunning ? nothing : reSet,
                  icon: const Icon(Icons.replay_outlined),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '0/4',
                      style: TextStyle(
                          color: Color.fromRGBO(234, 228, 196, 0.5),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ROUND',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '0/12',
                      style: TextStyle(
                          color: Color.fromRGBO(234, 228, 196, 0.5),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'GOAL',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

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
  int setminutes = 1500;
  static const restminutes = 300;
  late int totalSeconds = setminutes;
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
        if (userround == 4) {
          userround = 0;
          isResting = true;
          if (isResting = true) {
            inrestingTime();
          }
        }
      });
      timer.cancel();
    } else {
      setState(
        () {
          totalSeconds = totalSeconds - 1;
        },
      );
    }
  }

  void inrestingTime() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    usergoal = usergoal + 1;
    userround = 0;
    totalSeconds = restminutes;
    if (totalSeconds == 0) {
      setState(() {
        isResting = false;
        totalSeconds = setminutes;
        userround = 0;
      });
      timer.cancel();
    } else {
      setState(
        () {
          totalSeconds = totalSeconds - 1;
        },
      );
    }
  }

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
      setminutes = 1500;
      totalSeconds = setminutes;
      userround = 0;
      usergoal = 0;
    });
  }

  void updateMinutes(int minutes) {
    setState(
      () {
        setminutes = minutes;
        totalSeconds = setminutes;
      },
    );
  }

  void nothing() {}

  String formatMinute(int seconds) {
    var duration1 = Duration(seconds: seconds);
    // print(duration.toString());
    // print(duration.toString().split("."));
    // print(duration.toString().split(".").first);
    // print(duration.toString().split(".").first.substring(2,4));
    return duration1.toString().split(".").first.substring(2, 4);
  }

  String formatSecond(int seconds) {
    var duration2 = Duration(seconds: seconds);
    // print(duration.toString());
    // print(duration.toString().split("."));
    // print(duration.toString().split(".").first);
    // print(duration.toString().split(".").first.substring(5,7));
    return duration2.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isResting
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: isResting
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.background,
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
                    TimeCard(
                      starttime: formatMinute(totalSeconds),
                    ),
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
                    TimeCard(
                      starttime: formatSecond(totalSeconds),
                    ),
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
                  color: isResting
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.background,
                ),
                alignment: Alignment.topCenter,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(
                      onPressed: () => updateMinutes(900),
                      child: const DurationCard(
                        totalminutes: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateMinutes(1200),
                      child: const DurationCard(
                        totalminutes: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateMinutes(1500),
                      child: const DurationCard(
                        totalminutes: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateMinutes(1800),
                      child: const DurationCard(
                        totalminutes: 30,
                      ),
                    ),
                    TextButton(
                      onPressed: () => updateMinutes(2),
                      child: const DurationCard(
                        totalminutes: 35,
                      ),
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
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline_outlined
                        : Icons.play_circle_outline_outlined,
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
                    Text(
                      '$userround/4',
                      style: const TextStyle(
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
                    Text(
                      '$usergoal/12',
                      style: const TextStyle(
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

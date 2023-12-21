// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/widgets/timecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          const Flexible(
            flex: 4,
            child: Column(
              children: [
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TimeCard(),
                    Text(
                      ':',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        // color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 60,
                      ),
                    ),
                    TimeCard(),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.red),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.green),
            ),
          ),
        ]),
      ),
    );
  }
}

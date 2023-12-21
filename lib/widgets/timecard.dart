import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/screens/homescreen.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow:Overflow.visible,
      clipBehavior: Clip.none,
      // overflow:Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: const Color.fromRGBO(234, 228, 196, 0.7),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 47,
              vertical: 50,
            ),
            child: Text('base'),
          ),
        ),
        Positioned(
          bottom: -60,
          right: -12,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(234, 228, 196, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 35,
              ),
              child: Text(
                '12',
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

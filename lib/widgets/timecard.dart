import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String starttime;

  const TimeCard({super.key, required this.starttime});

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
              horizontal: 45,
              vertical: 50,
            ),
            child: Text('base'),
          ),
        ),
        Positioned(
          bottom: -60,
          right: -15,
          child: Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(234, 228, 196, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                starttime,
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

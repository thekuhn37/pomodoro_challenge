import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
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
    );
  }
}

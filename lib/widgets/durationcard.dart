import 'package:flutter/material.dart';

class DurationCard extends StatelessWidget {
  final int totalminutes;

  const DurationCard({
    super.key,
    required this.totalminutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 2,
        ),
        child: Text(
          '$totalminutes',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

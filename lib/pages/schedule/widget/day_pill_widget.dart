import 'package:flutter/material.dart';

class DayPill extends StatelessWidget {
  final int position;
  final String data;

  const DayPill({
    Key? key,
    this.position = 0,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (position == 0)
          ? const EdgeInsets.only(left: 24, right: 8)
          : (position == 5)
              ? const EdgeInsets.only(left: 8, right: 24)
              : const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Center(
          child: Text(
            data,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(
            0xFFFF8F3E,
          ),
        ),
      ),
    );
  }
}

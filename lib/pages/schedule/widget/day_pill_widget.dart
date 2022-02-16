import 'package:flutter/material.dart';

class DayPill extends StatelessWidget {
  const DayPill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: const Center(
          child: Text(
            'Selasa',
            style: TextStyle(color: Colors.white),
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

import 'package:flutter/material.dart';

class DayPill extends StatelessWidget {
  final int position;
  final String data;
  final bool isActive;
  final VoidCallback onTap;

  const DayPill({
    Key? key,
    this.position = 0,
    this.isActive = false,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (position == 0)
          ? const EdgeInsets.only(left: 24, right: 8)
          : (position == 5)
              ? const EdgeInsets.only(left: 8, right: 24)
              : const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Center(
                child: Text(
                  data,
                  style: (isActive)
                      ? const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)
                      : TextStyle(
                          color: Colors.white.withOpacity(.8),
                        ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: (isActive)
                    ? const Color(
                        0xFFFF8F3E,
                      )
                    : Colors.white.withOpacity(.2),
              ),
            ),
            (isActive)
                ? AnimatedContainer(
                    margin: const EdgeInsets.only(top: 2),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(
                          0xFFFF8F3E,
                        )),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

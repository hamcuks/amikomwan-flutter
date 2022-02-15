import 'package:flutter/material.dart';

class AppMenuItem extends StatelessWidget {
  final String menuName;
  final IconData icon;
  final VoidCallback onTap;
  final bool isGradient;
  const AppMenuItem({
    Key? key,
    required this.onTap,
    required this.menuName,
    required this.icon,
    this.isGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF432A79),
              gradient: (isGradient)
                  ? const LinearGradient(
                      colors: [Color(0xFFFFBA35), Color(0xFFFF8F3E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
            ),
            child: Icon(
              icon,
              color: const Color(0xFFF3F3F3),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            menuName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF432A79),
            ),
          )
        ],
      ),
    );
  }
}

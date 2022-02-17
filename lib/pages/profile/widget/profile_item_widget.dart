import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String data;
  final IconData icon;
  final IconData? suffixIcon;
  final VoidCallback? suffixAction;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.data,
    required this.icon,
    this.suffixIcon,
    this.suffixAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF756D8D),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: const Color(0xFF756D8D).withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF756D8D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          (suffixIcon != null)
              ? IconButton(
                  onPressed: suffixAction,
                  icon: Icon(
                    suffixIcon,
                    color: const Color(0xFF756D8D),
                    size: 18,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
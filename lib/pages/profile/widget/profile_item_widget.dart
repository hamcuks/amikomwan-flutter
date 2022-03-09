import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String data;
  final IconData icon;
  final IconData? suffixIcon;
  final bool isSelectable;
  final VoidCallback? suffixAction;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.data,
    required this.icon,
    this.suffixIcon,
    this.suffixAction,
    this.isSelectable = false,
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
              (data.isNotEmpty)
                  ? FittedBox(
                      clipBehavior: Clip.hardEdge,
                      fit: BoxFit.fitWidth,
                      child: (isSelectable)
                          ? SelectableText(
                              data,
                              style: const TextStyle(
                                color: Color(0xFF756D8D),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Text(
                              data,
                              style: const TextStyle(
                                color: Color(0xFF756D8D),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    )
                  : Shimmer.fromColors(
                      baseColor: const Color(0xFFEEEEEE),
                      highlightColor: const Color(0xFFDADADA),
                      child: Container(
                        width: 150,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(8),
                        ),
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

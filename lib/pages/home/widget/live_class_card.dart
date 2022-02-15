import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class LiveClassCard extends StatelessWidget {
  final String kelas;
  const LiveClassCard({Key? key, required this.kelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8F3E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kelas sedang berlangsung',
                style: TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                kelas,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(1),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.video,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

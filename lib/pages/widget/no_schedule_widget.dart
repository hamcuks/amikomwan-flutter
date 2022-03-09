import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../helper/helper.dart';

class NoScheduleWidget extends StatelessWidget {
  final int? day;

  const NoScheduleWidget({
    Key? key,
    this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/json/warning.json', width: 54),
        const SizedBox(height: 8),
        Text(
            'Hari ${Helper().toUpperCamelCase(Helper().weekdayToString(day ?? DateTime.now().weekday))} gada kuliah Bor!'),
      ],
    );
  }
}

import '../../../data/model/schedule/schedule_model.dart';
import 'package:flutter/material.dart';

import '../../../helper/helper.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleModel data;
  final int position;
  final int length;

  const ScheduleCard({
    Key? key,
    required this.data,
    required this.position,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: (position == length - 1)
            ? 24
            : (position == 0)
                ? 8
                : 8,
        left: (position == 0)
            ? 24
            : (position == length - 1)
                ? 8
                : 8,
        bottom: 20,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: length == 1
            ? MediaQuery.of(context).size.width * .85
            : MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF686B6D).withOpacity(0.1),
              offset: const Offset(5, 5),
              blurRadius: 19,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 32,
              color: data.jenisKuliah == 'Teori'
                  ? const Color(0xFF432A79).withOpacity(.88)
                  : const Color(0xFFFF8F3E).withOpacity(.88),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    Helper().toUpperCamelCase(data.mataKuliah!),
                    style: const TextStyle(
                      color: Color(0xFF54505E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.namaDosen}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF756D8D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${data.waktu} | ${data.ruang}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF756D8D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

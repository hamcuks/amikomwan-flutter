import 'package:amikom_wan/data/model/schedule/schedule_model.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleModel data;

  const ScheduleCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 20,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
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
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 32,
              color: const Color(0xFF432A79).withOpacity(.88),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Interaksi Manusia dan Komputer',
                style: TextStyle(
                  color: Color(0xFF54505E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Eli Pujastuti, S. Kom, M. Eng',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF756D8D),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '07.00 - 08.50 | R 4.5.1',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF756D8D),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

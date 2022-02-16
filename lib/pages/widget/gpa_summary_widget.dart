import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class GPASummary extends StatelessWidget {
  const GPASummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * .25,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF442C79),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF3FA699)),
                      child: WaveWidget(
                        config: CustomConfig(
                          colors: [
                            Colors.white.withOpacity(.1),
                            Colors.greenAccent.withOpacity(0.2)
                          ],
                          durations: [10000, 20000],
                          heightPercentages: [0.20, 0.23],
                        ),
                        waveAmplitude: 0,
                        size: const Size(
                          double.infinity,
                          double.infinity,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '3.73',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFF3F3F3),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TranskripItem(
                    title: 'Jumlah SKS',
                    value: '18',
                  ),
                  TranskripItem(
                    title: 'Wajib',
                    value: '108',
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TranskripItem(
                    title: 'Konsentrasi',
                    value: '88',
                  ),
                  TranskripItem(
                    title: 'Pilihan',
                    value: '2',
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

class TranskripItem extends StatelessWidget {
  final String title;
  final String value;

  const TranskripItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF442C79),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF442C79),
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

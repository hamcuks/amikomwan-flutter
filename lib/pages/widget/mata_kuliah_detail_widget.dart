import 'package:flutter/material.dart';

class MataKuliahDetail extends StatelessWidget {
  final bool isTranskrip;
  final bool isKHS;

  const MataKuliahDetail({
    Key? key,
    this.isTranskrip = false,
    this.isKHS = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 140,
      margin: const EdgeInsets.only(bottom: 8, top: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Interaksi Manusia dan Komputer',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF442C79),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 54,
              color: const Color(0xFF442C79),
              child: _buildContent(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (isKHS) return _buildKHS();
    if (isTranskrip) return _buildTranskrip();

    return _buildSchedule();
  }

  Row _buildKHS() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Kode', 'ST0817'),
        _mataKuliahInfo('SKS', '2'),
        _mataKuliahInfo('Nilai', 'A'),
      ],
    );
  }

  Row _buildTranskrip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Kode', 'ST0817'),
        _mataKuliahInfo('Sifat', 'Wajib'),
        _mataKuliahInfo('SKS', '2'),
        _mataKuliahInfo('Nilai', 'A'),
      ],
    );
  }

  Row _buildSchedule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Jam', '08.00 - 10.40'),
        _mataKuliahInfo('Ruang', '5.2.1'),
        _mataKuliahInfo('Perkuliahan', 'Praktikum'),
      ],
    );
  }

  Column _mataKuliahInfo(String key, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          key,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFFA39CB8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFFF3F3F3),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

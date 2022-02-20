import 'package:amikom_wan/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MataKuliahDetail extends StatelessWidget {
  final dynamic data;
  final bool isTranskrip;
  final bool isKHS;

  const MataKuliahDetail({
    Key? key,
    this.data,
    this.isTranskrip = false,
    this.isKHS = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: (data != null)
                ? Text(
                    Helper().toUpperCamelCase(data.namaMk),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF442C79),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: const Color(0xFFEEEEEE),
                    highlightColor: const Color(0xFFDADADA),
                    child: Container(
                      width: 150,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 54,
              color: const Color(0xFF442C79),
              child: _buildContent(data),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent(dynamic data) {
    if (isKHS) return _buildKHS(data);
    if (isTranskrip) return _buildTranskrip(data);

    return _buildSchedule(data);
  }

  Row _buildKHS(dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Kode', '${data?.kode ?? ""}'),
        _mataKuliahInfo('SKS', '${data?.jmlSks ?? ""}'),
        _mataKuliahInfo('Nilai', '${data?.nilai ?? "-"}'),
      ],
    );
  }

  Row _buildTranskrip(dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Kode', '${data?.kode ?? ""}'),
        _mataKuliahInfo('Sifat', '${data?.namaSifatMk ?? ""}'),
        _mataKuliahInfo('SKS', '${data?.jmlSks ?? ""}'),
        _mataKuliahInfo('Nilai', '${data?.nilai ?? "-"}'),
      ],
    );
  }

  Row _buildSchedule(dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mataKuliahInfo('Hari', '${data?.hari ?? ""}'),
        _mataKuliahInfo('Jam', '${data?.waktu ?? ""}'),
        _mataKuliahInfo('Ruang', '${data?.ruang ?? ""}'),
        _mataKuliahInfo('Perkuliahan', '${data?.jenisKuliah ?? ""}'),
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
        (value.isNotEmpty)
            ? const SizedBox(height: 4)
            : const SizedBox(height: 8),
        (value.isNotEmpty)
            ? Text(
                value,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFFF3F3F3),
                  fontWeight: FontWeight.bold,
                ),
              )
            : Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 84, 52, 155),
                highlightColor: const Color.fromARGB(255, 109, 67, 201),
                child: Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF442C79),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
      ],
    );
  }
}

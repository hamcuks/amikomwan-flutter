import 'dart:developer';

import 'package:amikom_wan/cubit/khs/action/cubit/akademik_cubit.dart';
import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/data/model/khs/akademik/akademik_model.dart';
import 'package:amikom_wan/pages/widget/app_drop_down.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widget/mata_kuliah_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/gpa_summary_widget.dart';

class KHSPage extends StatelessWidget {
  KHSPage({Key? key}) : super(key: key);

  int _semester = 1;
  String _tahunAkademik = '2021/2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF442C79),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.arrow_left),
        ),
        title: const Text(
          'Kartu Hasil Studi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFAFAFA),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * .2,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color(0xFF442C79),
            child: BlocBuilder<AkademikCubit, AkademikState>(
              builder: (context, state) {
                late List<Semester> dataSemester;
                if (state is AkademikSuccess) {
                  dataSemester = state.data.semester!;
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppDropdown(
                        hintText: 'Pilih Semester',
                        data: (state is AkademikSuccess)
                            ? dataSemester.map((x) => x.nama!).toList()
                            : ['Ganjil', 'Genap'],
                        isExpanded: true,
                        onChanged: (value) {
                          var _intValue = dataSemester.map((e) {
                            if (e.nama == value) {
                              return e.kode;
                            }
                          }).toList();
                          _semester = _intValue
                              .firstWhere((element) => element != null) as int;
                          context
                              .read<KhsCubit>()
                              .get(_semester, _tahunAkademik);
                          log(_semester.toString(), name: "SEMESTER ");
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppDropdown(
                        hintText: 'Pilih Tahun',
                        data: (state is AkademikSuccess)
                            ? state.data.tahun!
                                .map((x) => x.thnAjaran!)
                                .toList()
                            : ['2020/2021', '2021/2022'],
                        isExpanded: true,
                        onChanged: (value) {
                          _tahunAkademik = value;
                          context
                              .read<KhsCubit>()
                              .get(_semester, _tahunAkademik);
                          log(_tahunAkademik);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          BlocBuilder<KhsCubit, KhsState>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 72),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GPASummary(
                      data: (state is KhsSuccess) ? state.data : null,
                    ),
                  ),
                  Expanded(
                    child: _buildListMataKuliah(state),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  // Container _buildEmptyData() {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
  //     clipBehavior: Clip.antiAlias,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(4),
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: const Color(0xFF686B6D).withOpacity(0.1),
  //           offset: const Offset(5, 5),
  //           blurRadius: 19,
  //           spreadRadius: 2,
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Lottie.asset('assets/json/warning.json', width: 72),
  //         const SizedBox(height: 8),
  //         const Text('Tidak Ada Data Matakuliah'),
  //       ],
  //     ),
  //   );
  // }

  ListView _buildListMataKuliah(KhsState state) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
      physics: const BouncingScrollPhysics(),
      itemCount: (state is KhsSuccess) ? state.data.khs!.length : 5,
      itemBuilder: (context, i) => MataKuliahDetail(
        isKHS: true,
        data: (state is KhsSuccess) ? state.data.khs![i] : null,
      ),
    );
  }
}

import 'dart:developer';

import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/pages/widget/app_drop_down.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppDropdown(
                    hintText: 'Pilih Semester',
                    data: const ['Ganjil', 'Genap'],
                    isExpanded: true,
                    onChanged: (value) {
                      _semester = (value.toLowerCase() == 'ganjil') ? 1 : 2;
                      context.read<KhsCubit>().get(_semester, _tahunAkademik);
                      log(_semester.toString());
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppDropdown(
                    hintText: 'Pilih Tahun',
                    data: const ['2019/2020', '2020/2021', '2021/2022'],
                    isExpanded: true,
                    onChanged: (value) {
                      _tahunAkademik = value;
                      context.read<KhsCubit>().get(_semester, _tahunAkademik);
                      log(_tahunAkademik);
                    },
                  ),
                ),
              ],
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
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 24, right: 24),
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          (state is KhsSuccess) ? state.data.khs!.length : 5,
                      itemBuilder: (context, i) => MataKuliahDetail(
                        isKHS: true,
                        data: (state is KhsSuccess) ? state.data.khs![i] : null,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

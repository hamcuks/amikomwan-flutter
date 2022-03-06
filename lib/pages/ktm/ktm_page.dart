import 'dart:convert';
import 'dart:developer';

import 'package:amikom_wan/cubit/ktm/ktm_cubit.dart';
import 'package:amikom_wan/cubit/profile/mahasiswa/profile_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/data/model/khs/akademik/akademik_model.dart';
import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:amikom_wan/data/repository/khs/khs_repository.dart';
import 'package:amikom_wan/pages/widget/app_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class KTMPage extends StatelessWidget {
  KTMPage({Key? key}) : super(key: key);

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
          'Kartu Tanda Mahasiswa',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFAFAFA),
          ),
        ),
      ),
      body: BlocBuilder<KtmCubit, KtmState>(
        bloc: KtmCubit()..get(),
        builder: (context, state) {
          if (state is KtmSuccess) {
            return Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.memory(
                    state.data,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            );
          } else if (state is KtmError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Lottie.asset(
                'assets/json/loading.json',
                width: 250,
              ),
            );
          }
        },
      ),
    );
  }
}

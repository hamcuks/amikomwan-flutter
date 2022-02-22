import 'dart:developer';

import 'package:amikom_wan/cubit/khs/action/cubit/akademik_cubit.dart';
import 'package:amikom_wan/cubit/profile/mahasiswa/profile_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/data/model/khs/akademik/akademik_model.dart';
import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:amikom_wan/data/repository/khs/khs_repository.dart';
import 'package:amikom_wan/pages/widget/app_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class KTMPage extends StatelessWidget {
  KTMPage({Key? key}) : super(key: key);

  List<String> semester = ['Ganjil', 'Genap'];
  List<String> tahunAkademik = ['2019/2020', '2020/2021', '2021/2022'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              width: 300,
              child: AppButton(
                onPressed: () async {
                  var box = await Hive.openBox('app_config');

                  AkademikModel data = await box.get('akademik');
                  var x = data.semester?.map((x) {
                    if (x.nama == 'Ganjil') {
                      return x.kode;
                    }
                  }).toList();

                  print(x?.firstWhere((element) => element != null));
                },
                text: 'Get profile',
              ),
            )
          ],
        ),
      ),
    );
  }
}

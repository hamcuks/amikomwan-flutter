import 'package:amikom_wan/cubit/profile/mahasiswa/profile_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/pages/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                onPressed: () {
                  context.read<ScheduleCubit>().get();
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

import 'dart:developer';

import 'package:amikom_wan/cubit/schedule/action/choose_day/choose_day_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/pages/widget/matakulia_loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widget/mata_kuliah_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/day_pill_widget.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key}) : super(key: key);

  final ScrollController _controller =
      ScrollController(initialScrollOffset: 0.5);

  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jum\'at',
    'Sabtu'
  ];

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
          'Jadwal Perkuliahan',
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
            height: MediaQuery.of(context).size.height * .25,
            color: const Color(0xFF442C79),
          ),
          Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 54,
                color: const Color(0xFF442C79),
                child: BlocBuilder<ChooseDayCubit, String>(
                  builder: (context, state) {
                    return ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 16),
                      physics: const BouncingScrollPhysics(),
                      itemCount: days.length,
                      itemBuilder: (context, i) => DayPill(
                        data: days[i],
                        position: i,
                        isActive: state == days[i].toLowerCase(),
                        onTap: () => context
                            .read<ChooseDayCubit>()
                            .chooseDay(days[i].toLowerCase()),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<ScheduleCubit, ScheduleState>(
                  builder: (context, state) {
                log(state.toString());
                if (state is ScheduleSuccess) {
                  if (state.data.isEmpty) {
                    return Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/json/warning.json', width: 54),
                            const SizedBox(height: 8),
                            const Text('Tidak Ada Jadwal'),
                          ],
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: state.data.length,
                      itemBuilder: (context, i) => MataKuliahDetail(
                        data: state.data[i],
                      ),
                    ),
                  );
                }

                return const MataKuliahLoadingAnimation();

                // return const Expanded(
                //   child: Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // );
              })
            ],
          ),
        ],
      ),
    );
  }
}

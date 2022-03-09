import 'package:amikom_wan/cubit/schedule/action/choose_day/choose_day_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widget/mata_kuliah_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/no_schedule_widget.dart';
import 'widget/day_pill_widget.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 0.5);

  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];

  @override
  void initState() {
    context.read<ScheduleCubit>().get();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF442C79),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<ChooseDayCubit>().chooseDay(DateTime.now().weekday);
          },
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
            height: MediaQuery.of(context).size.height * .2,
            color: const Color(0xFF442C79),
          ),
          Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 54,
                color: const Color(0xFF442C79),
                child: BlocBuilder<ChooseDayCubit, int>(
                  builder: (context, state) {
                    print(state);
                    return ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 16),
                      physics: const BouncingScrollPhysics(),
                      itemCount: days.length,
                      itemBuilder: (context, i) => DayPill(
                        data: days[i],
                        position: i,
                        isActive: state - 1 == i,
                        onTap: () {
                          context.read<ChooseDayCubit>().chooseDay(
                              Helper().stringToWeekDay(days[i].toLowerCase()));
                        },
                      ),
                    );
                  },
                ),
              ),
              BlocConsumer<ScheduleCubit, ScheduleState>(
                  listener: (context, state) {
                if (state is ScheduleSuccess) {
                  if (_controller.hasClients) {
                    if (DateTime.now().weekday * 50 >= 155 &&
                        DateTime.now().weekday * 50 <= 350) {
                      _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInCubic,
                      );
                    }
                  }
                }
              }, builder: (context, state) {
                return BlocBuilder<ChooseDayCubit, int>(
                  builder: (context, day) {
                    var data = [];
                    if (state is ScheduleSuccess) {
                      data = state.data
                          .where((element) =>
                              element.idHari ==
                              context.read<ChooseDayCubit>().state)
                          .toList();
                    } else if (state is ScheduleLoading) {
                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: 5,
                          itemBuilder: (context, i) => MataKuliahDetail(
                            data: (state is ScheduleSuccess) ? data[i] : null,
                          ),
                        ),
                      );
                    }

                    if (data.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount:
                              (state is ScheduleSuccess) ? data.length : 5,
                          itemBuilder: (context, i) => MataKuliahDetail(
                            data: (state is ScheduleSuccess) ? data[i] : null,
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
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
                          child: NoScheduleWidget(
                              day: context.read<ChooseDayCubit>().state),
                        ),
                      );
                    }
                  },
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}

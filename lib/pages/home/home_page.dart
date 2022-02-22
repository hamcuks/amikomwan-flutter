import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/cubit/profile/mahasiswa/profile_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/data/model/schedule/schedule_model.dart';
import 'package:amikom_wan/pages/home/widget/live_class_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/app_menu_item.dart';
import '../../routes.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/schedule_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _controller = PageController(
    viewportFraction: 0.5,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: size.height * .43,
                  color: const Color(0xFF432A79),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Dashboard',
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileSuccess) {
                                return Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F3F3),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${state.data.mhs!.npmImg}'),
                                    ),
                                  ),
                                );
                              }

                              return Shimmer.fromColors(
                                baseColor: const Color(0xFFEEEEEE),
                                highlightColor: const Color(0xFFDADADA),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF3F3F3),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      // const SizedBox(height: 32),
                      // const LiveClassCard(
                      //   kelas: 'Pemrograman Web lanjut',
                      // ),
                      SizedBox(height: size.height * 0.02),
                      BlocBuilder<ScheduleCubit, ScheduleState>(
                          builder: (context, state) {
                        if (state is ScheduleSuccess) {
                          return _ScheduleSection(
                            controller: _controller,
                            data: state.data,
                          );
                        }

                        return Shimmer.fromColors(
                          baseColor: const Color(0xFFEEEEEE),
                          highlightColor: const Color(0xFFDADADA),
                          child: Column(
                            children: [
                              const SizedBox(height: 32),
                              Container(
                                width: double.maxFinite,
                                height: 150,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: size.height * 0.02),
                      const _AppMenuSection()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AppMenuSection extends StatelessWidget {
  const _AppMenuSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'App Menu',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF432A79),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                AppMenuItem(
                  menuName: 'Scan QR',
                  icon: FeatherIcons.maximize,
                  isGradient: true,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.scanQr);
                  },
                ),
                const SizedBox(height: 24),
                AppMenuItem(
                  menuName: 'Transkrip Nilai',
                  icon: FeatherIcons.fileText,
                  onTap: () {
                    // context.read<TranskripCubit>().get();
                    Navigator.pushNamed(context, Routes.transkrip);
                  },
                ),
              ],
            ),
            Column(
              children: [
                AppMenuItem(
                  menuName: 'Jadwal',
                  icon: FeatherIcons.calendar,
                  onTap: () {
                    // context.read<ScheduleCubit>().get();
                    Navigator.pushNamed(context, Routes.schedule);
                  },
                ),
                const SizedBox(height: 24),
                AppMenuItem(
                  menuName: 'KTM',
                  icon: FeatherIcons.creditCard,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ktm);
                  },
                ),
              ],
            ),
            Column(
              children: [
                AppMenuItem(
                  menuName: 'KHS',
                  icon: FeatherIcons.fileMinus,
                  onTap: () async {
                    var box = await Hive.openBox('app_config');
                    int _semester = box.get('semester');
                    String _tahunAkademik = box.get('tahunAkademik');
                    context.read<KhsCubit>().get(_semester, _tahunAkademik);
                    Navigator.pushNamed(context, Routes.khs);
                  },
                ),
                const SizedBox(height: 24),
                AppMenuItem(
                  menuName: 'Profile',
                  icon: FeatherIcons.user,
                  onTap: () {
                    // context.read<ProfileCubit>().get();
                    Navigator.pushNamed(context, Routes.profile);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ScheduleSection extends StatelessWidget {
  final List<ScheduleModel> data;
  final PageController controller;

  const _ScheduleSection({
    Key? key,
    required this.data,
    required this.controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Jadwal Hari Ini',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFAFAFA),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.schedule),
              color: const Color(0xFFFAFAFA),
              icon: const Icon(CupertinoIcons.arrow_right),
            )
          ],
        ),
        const SizedBox(height: 16),
        (data.isEmpty)
            ? Container(
                width: double.maxFinite,
                height: 150,
                margin: const EdgeInsets.only(bottom: 32),
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
              )
            : SizedBox(
                height: 200,
                child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, i) => ScheduleCard(data: data[i]),
                ),
              )
      ],
    );
  }
}

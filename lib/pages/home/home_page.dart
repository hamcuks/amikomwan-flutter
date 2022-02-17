import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/cubit/profile/mahasiswa/profile_cubit.dart';
import 'package:amikom_wan/cubit/transkrip/transkrip_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/app_menu_item.dart';
import '../../routes.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/live_class_card.dart';
import 'widget/schedule_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _controller = PageController(
    viewportFraction: 0.5,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * .5,
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

                              return Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      const LiveClassCard(
                        kelas: 'Pemrograman Web lanjut',
                      ),
                      const SizedBox(height: 32),
                      _ScheduleSection(controller: _controller),
                      const SizedBox(height: 32),
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
            AppMenuItem(
              menuName: 'Scan QR',
              icon: FeatherIcons.maximize,
              isGradient: true,
              onTap: () {},
            ),
            AppMenuItem(
              menuName: 'Jadwal',
              icon: FeatherIcons.calendar,
              onTap: () => Navigator.pushNamed(context, Routes.schedule),
            ),
            AppMenuItem(
              menuName: 'KHS',
              icon: FeatherIcons.fileMinus,
              onTap: () {
                context.read<KhsCubit>().get();
                Navigator.pushNamed(context, Routes.khs);
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppMenuItem(
              menuName: 'Transkrip Nilai',
              icon: FeatherIcons.fileText,
              onTap: () {
                context.read<TranskripCubit>().get();
                Navigator.pushNamed(context, Routes.transkrip);
              },
            ),
            AppMenuItem(
              menuName: 'KTM',
              icon: FeatherIcons.creditCard,
              onTap: () {},
            ),
            AppMenuItem(
              menuName: 'Mahasiswa',
              icon: FeatherIcons.user,
              onTap: () {
                context.read<ProfileCubit>().get();
                Navigator.pushNamed(context, Routes.profile);
              },
            ),
          ],
        )
      ],
    );
  }
}

class _ScheduleSection extends StatelessWidget {
  const _ScheduleSection({
    Key? key,
    required PageController controller,
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
              onPressed: () {},
              color: const Color(0xFFFAFAFA),
              icon: const Icon(CupertinoIcons.arrow_right),
            )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, i) => const ScheduleCard(),
          ),
        )
      ],
    );
  }
}

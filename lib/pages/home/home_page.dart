part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: size.height * .4,
                  color: const Color(0xFF432A79),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 54, 24, 0),
                      child: Row(
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
                            bloc: ProfileCubit()..get(),
                            builder: (context, state) {
                              if (state is ProfileSuccess) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.profile),
                                  child: Container(
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
                                  ),
                                );
                              }

                              return Shimmer.fromColors(
                                baseColor: const Color(0xFFEEEEEE),
                                highlightColor: const Color(0xFFDADADA),
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.profile),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF3F3F3),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(height: 32),
                    // const LiveClassCard(
                    //   kelas: 'Pemrograman Web lanjut',
                    // ),
                    SizedBox(height: size.height * 0.04),
                    BlocBuilder<ScheduleCubit, ScheduleState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                              child: Row(
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
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed(Routes.schedule),
                                    color: const Color(0xFFFAFAFA),
                                    icon:
                                        const Icon(CupertinoIcons.arrow_right),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildDataSchedule(state),
                          ],
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: _AppMenuSection(),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataSchedule(ScheduleState state) {
    if (state is ScheduleLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFEEEEEE),
          highlightColor: const Color(0xFFDADADA),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 170,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      if (state is ScheduleSuccess) {
        List<ScheduleModel> _data = state.data
            .where((element) => element.idHari == DateTime.now().weekday)
            .toList();
        if (_data.isEmpty) {
          return Container(
            width: double.maxFinite,
            height: 170,
            margin: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
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
            child: const NoScheduleWidget(),
          );
        } else {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _data.length,
              itemBuilder: (context, i) => ScheduleCard(
                  data: _data[i], position: i, length: _data.length),
            ),
          );
        }
      } else {
        return Container(
          width: double.maxFinite,
          height: 170,
          margin: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
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
          child: const NoScheduleWidget(),
        );
      }
    }
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ],
            ),
            Column(
              children: [
                AppMenuItem(
                  menuName: 'Jadwal',
                  icon: FeatherIcons.calendar,
                  onTap: () {
                    // context.read<ScheduleCubit>().get();
                    int _day = DateTime.now().weekday;

                    if (_day == 7) _day -= 1;
                    context.read<ChooseDayCubit>().chooseDay(_day);
                    Navigator.pushNamed(context, Routes.schedule);
                  },
                ),
                const SizedBox(height: 24),
                AppMenuItem(
                  menuName: 'Transkrip Nilai',
                  icon: FeatherIcons.fileText,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.transkrip);
                  },
                ),
              ],
            ),
            Column(
              children: [
                AppMenuItem(
                  menuName: 'Data Presensi',
                  icon: FeatherIcons.barChart2,
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.dataPresensi);
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
          ],
        ),
      ],
    );
  }
}

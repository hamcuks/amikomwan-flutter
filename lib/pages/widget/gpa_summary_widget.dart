part of 'widgets.dart';

class GPASummary extends StatelessWidget {
  final dynamic data;
  final bool isKHS;
  const GPASummary({
    Key? key,
    this.data,
    this.isKHS = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * .25,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF686B6D).withOpacity(0.3),
                offset: const Offset(5, 5),
                blurRadius: 19,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    children: [
                      BlocBuilder<GpaSummaryCubit, GpaLevelModel>(
                        bloc: GpaSummaryCubit()
                          ..getGPALevel(
                              isKHS ? data?.ipkSem ?? 0.0 : data?.ipk ?? 0.0),
                        builder: (context, state) {
                          return Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state.backgroundColor),
                            child: WaveWidget(
                              config: CustomConfig(
                                colors: state.colors,
                                durations: [10000, 20000],
                                heightPercentages: state.heightPercentage,
                              ),
                              waveAmplitude: 0,
                              size: const Size(
                                double.infinity,
                                double.infinity,
                              ),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${isKHS ? data?.ipkSem ?? 0 : data?.ipk ?? 0}",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFFF3F3F3),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TranskripItem(
                      title: 'Jumlah SKS',
                      value: '${data?.jmlSks ?? ""}',
                    ),
                    isKHS
                        ? TranskripItem(
                            title: 'Indeks Prestasi',
                            value: '${data?.ipkSem ?? ""}',
                          )
                        : TranskripItem(
                            title: 'Wajib',
                            value: '${data?.sksWajib ?? ""}',
                          ),
                  ],
                ),
              ),
              !isKHS
                  ? Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TranskripItem(
                            title: 'Konsentrasi',
                            value: '${data?.sksKonsentrasi ?? ""}',
                          ),
                          TranskripItem(
                            title: 'Pilihan',
                            value: '${data?.sksPilihan ?? ""}',
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class TranskripItem extends StatelessWidget {
  final String title;
  final String value;

  const TranskripItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF442C79),
            ),
          ),
          const SizedBox(height: 8),
          (value.isNotEmpty)
              ? Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF442C79),
                    fontWeight: FontWeight.w700,
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: const Color(0xFFEEEEEE),
                  highlightColor: const Color(0xFFDADADA),
                  child: Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF442C79),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

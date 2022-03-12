part of '../pages.dart';

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
            child: BlocBuilder<AkademikCubit, AkademikState>(
              builder: (context, state) {
                late List<Semester> dataSemester;
                if (state is AkademikSuccess) {
                  dataSemester = state.data.semester!;
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppDropdown(
                        hintText: 'Pilih Semester',
                        data: (state is AkademikSuccess)
                            ? dataSemester.map((x) => x.nama!).toList()
                            : ['Ganjil', 'Genap'],
                        isExpanded: true,
                        onChanged: (value) {
                          var _intValue = dataSemester.map((e) {
                            if (e.nama == value) {
                              return e.kode;
                            }
                          }).toList();
                          _semester = _intValue
                              .firstWhere((element) => element != null) as int;
                          context
                              .read<KhsCubit>()
                              .get(_semester, _tahunAkademik);
                          log(_semester.toString(), name: "SEMESTER ");
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppDropdown(
                        hintText: 'Pilih Tahun',
                        data: (state is AkademikSuccess)
                            ? state.data.tahun!
                                .map((x) => x.thnAjaran!)
                                .toList()
                            : ['2020/2021', '2021/2022'],
                        isExpanded: true,
                        onChanged: (value) {
                          _tahunAkademik = value;
                          context
                              .read<KhsCubit>()
                              .get(_semester, _tahunAkademik);
                          log(_tahunAkademik);
                        },
                      ),
                    ),
                  ],
                );
              },
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
                    child: _buildListMataKuliah(state),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  ListView _buildListMataKuliah(KhsState state) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
      physics: const BouncingScrollPhysics(),
      itemCount: (state is KhsSuccess) ? state.data.khs!.length : 5,
      itemBuilder: (context, i) => MataKuliahDetail(
        isKHS: true,
        data: (state is KhsSuccess) ? state.data.khs![i] : null,
      ),
    );
  }
}

import 'package:amikom_wan/cubit/transkrip/transkrip_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/mata_kuliah_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/gpa_summary_widget.dart';

class TranskripPage extends StatelessWidget {
  const TranskripPage({Key? key}) : super(key: key);

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
          'Transkrip Nilai',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFAFAFA),
          ),
        ),
      ),
      body: BlocBuilder<TranskripCubit, TranskripState>(
        bloc: TranskripCubit()..get(),
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * .2,
                padding: const EdgeInsets.all(24),
                color: const Color(0xFF442C79),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GPASummary(
                      isKHS: false,
                      data: (state is TranskripSuccess) ? state.data : null,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      physics: const BouncingScrollPhysics(),
                      itemCount: (state is TranskripSuccess)
                          ? state.data.transkrip!.length
                          : 5,
                      itemBuilder: (context, i) {
                        return MataKuliahDetail(
                          data: (state is TranskripSuccess)
                              ? state.data.transkrip![i]
                              : null,
                          isTranskrip: true,
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

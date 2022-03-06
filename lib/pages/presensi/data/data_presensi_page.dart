import '../../../cubit/presensi/data/data_presensi_cubit.dart';
import '../../widget/mata_kuliah_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPresensiPage extends StatelessWidget {
  const DataPresensiPage({Key? key}) : super(key: key);

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
          'Data Presensi',
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
          BlocConsumer<DataPresensiCubit, DataPresensiState>(
            bloc: DataPresensiCubit()..get(),
            builder: (context, state) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 5,
                itemBuilder: (context, i) => MataKuliahDetail(
                  isDataPresensi: true,
                  data: (state is DataPresensiSuccess) ? state.data[i] : null,
                ),
              );
            },
            listener: (context, state) {},
          ),
        ],
      ),
    );
  }
}

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
      body: Column(
        children: [
          const GPASummary(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, i) => const MataKuliahDetail(
                isTranskrip: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

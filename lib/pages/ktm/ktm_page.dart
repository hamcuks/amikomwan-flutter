import 'package:flutter/material.dart';

class KTMPage extends StatelessWidget {
  KTMPage({Key? key}) : super(key: key);

  List<String> semester = ['Ganjil', 'Genap'];
  List<String> tahunAkademik = ['2019/2020', '2020/2021', '2021/2022'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: const [
            // AppDropdown(hintText: 'Pilih Semester', data: semester),
            // AppDropdown(hintText: 'Pilih Tahun', data: tahunAkademik),
          ],
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'gpa_summary_state.dart';

class GpaSummaryCubit extends Cubit<GpaLevelModel> {
  List<GpaLevelModel> data = [
    GpaLevelModel(
      backgroundColor: Colors.grey,
      colors: [Colors.white.withOpacity(.1), Colors.blueGrey.withOpacity(.5)],
      heightPercentage: [0.8, 0.87],
    ),
    GpaLevelModel(
      backgroundColor: Colors.red[300],
      colors: [Colors.white.withOpacity(.1), Colors.redAccent.withOpacity(0.5)],
      heightPercentage: [0.6, 0.67],
    ),
    GpaLevelModel(
      backgroundColor: Colors.orangeAccent,
      colors: [Colors.orange.shade200, Colors.amber],
      heightPercentage: [0.4, 0.45],
    ),
    GpaLevelModel(
      backgroundColor: const Color(0xFF3FA699),
      colors: [
        Colors.white.withOpacity(.1),
        Colors.greenAccent.withOpacity(0.2)
      ],
      heightPercentage: [0.05, 0.07],
    ),
  ];

  GpaSummaryCubit()
      : super(
          GpaLevelModel(
            backgroundColor: Colors.grey,
            colors: [
              Colors.white.withOpacity(.1),
              Colors.blueGrey.withOpacity(.5)
            ],
            heightPercentage: [0.8, 0.87],
          ),
        );

  void getGPALevel(dynamic value) {
    if (value >= 0.1 && value <= 1.5) {
      emit(data[1]);
    } else if (value >= 1.6 && value <= 2.8) {
      emit(data[2]);
    } else if (value >= 2.9 && value <= 4) {
      emit(data[3]);
    } else {
      emit(data[0]);
    }
  }
}

class GpaLevelModel {
  Color? backgroundColor;
  List<Color>? colors;
  List<double>? heightPercentage;

  GpaLevelModel({this.backgroundColor, this.colors, this.heightPercentage});
}

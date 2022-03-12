import 'dart:developer';
import 'dart:io';

import 'package:amikom_wan/pages/widget/app_menu_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/cubits.dart';
import '../data/model/models.dart';
import '../helper/helper.dart';
import '../routes.dart';
import 'home/widget/schedule_card.dart';
import 'profile/widget/profile_item_widget.dart';
import 'schedule/widget/day_pill_widget.dart';
import 'widget/app_button.dart';
import 'widget/app_drop_down.dart';
import 'widget/app_form_field.dart';
import 'widget/gpa_summary_widget.dart';
import 'widget/mata_kuliah_detail_widget.dart';
import 'widget/no_schedule_widget.dart';

part 'login/login_page.dart';
part 'home/home_page.dart';
part 'khs/khs_page.dart';
part 'ktm/ktm_page.dart';
part 'presensi/presensi_page.dart';
part 'presensi/presensi_result_page.dart';
part 'profile/profile_page.dart';
part 'schedule/schedule_page.dart';
part 'transkrip/transkrip_page.dart';

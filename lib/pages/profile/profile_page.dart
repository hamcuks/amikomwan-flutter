import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/profile/action/profile_action_cubit.dart';
import '../../cubit/profile/mahasiswa/profile_cubit.dart';
import '../../helper/helper.dart';
import '../widget/app_button.dart';
import '../../routes.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'widget/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          'Profile',
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
            height: MediaQuery.of(context).size.height * .25,
            color: const Color(0xFF442C79),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            bloc: ProfileCubit()..get(),
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 24),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (state is ProfileSuccess)
                            ? Center(
                                child: Container(
                                  width: 92,
                                  height: 92,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            state.data.mhs!.npmImg!),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )
                            : Center(
                                child: Shimmer.fromColors(
                                  baseColor: const Color(0xFFEEEEEE),
                                  highlightColor: const Color(0xFFDADADA),
                                  child: Container(
                                    width: 92,
                                    height: 92,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 32),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(24),
                          color: const Color(0xFFF2F8FD),
                          child: const Text(
                            'Data Mahasiswa',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF756D8D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ProfileItem(
                          icon: FeatherIcons.user,
                          title: 'Nama',
                          data: (state is ProfileSuccess)
                              ? Helper().toUpperCamelCase(state.data.mhs!.nama!)
                              : '',
                        ),
                        ProfileItem(
                          icon: FeatherIcons.creditCard,
                          title: 'NIM',
                          data: (state is ProfileSuccess)
                              ? '${state.data.mhs!.npm}'
                              : '',
                        ),
                        ProfileItem(
                          icon: FeatherIcons.calendar,
                          title: 'Angkatan',
                          data: (state is ProfileSuccess)
                              ? '${state.data.mhs!.angkatan}'
                              : '',
                        ),
                        ProfileItem(
                          icon: FeatherIcons.award,
                          title: 'Prodi',
                          data: (state is ProfileSuccess)
                              ? '${state.data.mhs!.prodi}'
                              : '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.maxFinite,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(24),
                          color: const Color(0xFFF2F8FD),
                          child: const Text(
                            'Data Email',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF756D8D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ProfileItem(
                          icon: FeatherIcons.atSign,
                          title: 'Email',
                          data: (state is ProfileSuccess)
                              ? '${state.data.mhs!.emailAmikom}'
                              : '',
                        ),
                        BlocBuilder<ProfileActionCubit, bool>(
                          builder: (context, passwordState) {
                            return ProfileItem(
                              icon: FeatherIcons.key,
                              title: 'Password',
                              suffixIcon: (!passwordState)
                                  ? FeatherIcons.eye
                                  : FeatherIcons.eyeOff,
                              suffixAction: () => context
                                  .read<ProfileActionCubit>()
                                  .showPassword(!passwordState),
                              data: (state is ProfileSuccess)
                                  ? (passwordState)
                                      ? '${state.data.mhs!.passEmail}'
                                      : '***************'
                                  : '',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        onPressed: () async {
                          context.read<AuthCubit>().logOut();
                        },
                        text: 'Logout',
                        isLoading: (state is AuthLoading),
                        color: const Color(0xFFFF6C3E),
                      );
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

import '../../cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../widget/app_button.dart';
import '../widget/app_form_field.dart';
import '../../routes.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _npmController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/amikom-logo.png', width: 96),
                const SizedBox(height: 48),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppFormField(
                        controller: _npmController,
                        hintText: 'NIM',
                        icon: FeatherIcons.creditCard,
                      ),
                      const SizedBox(height: 16),
                      AppFormField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: FeatherIcons.key,
                        secret: true,
                      ),
                      const SizedBox(height: 48),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            Navigator.pushReplacementNamed(
                                context, Routes.home);
                          } else if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return AppButton(
                              text: 'Login',
                              isLoading: true,
                              onPressed: () {},
                            );
                          } else {
                            return AppButton(
                              text: 'Login',
                              onPressed: () async {
                                var box = await Hive.openBox('credentials');
                                String npm = await box.get('npm') ?? '';
                                if (_formKey.currentState!.validate()) {
                                  if (npm.isNotEmpty &&
                                      npm != _npmController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Aplikasi hanya bisa digunakan untuk satu NIM'),
                                      ),
                                    );
                                  } else {
                                    context.read<AuthCubit>().login(
                                        _npmController.text,
                                        _passwordController.text);
                                    context.read<AuthCubit>().authPresensi(
                                        _npmController.text,
                                        _passwordController.text);
                                  }
                                }
                              },
                            );
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 34,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFF3F9FE),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(FeatherIcons.info, color: Color(0xFFA39CB8)),
                    SizedBox(width: 16),
                    FittedBox(
                      child: Text(
                        'Aplikasi hanya bisa dipakai satu akun \nmahasiswa ya bor!',
                        style: TextStyle(
                          color: Color(0xFFA39CB8),
                          fontSize: 12,
                          height: 1.6,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

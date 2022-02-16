import 'package:amikom_wan/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/amikom-logo.png', width: 118),
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
                        Navigator.pushReplacementNamed(context, Routes.home);
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(
                                  _npmController.text,
                                  _passwordController.text);
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
      ),
    );
  }
}

import 'package:amikom_wan/pages/widget/app_button.dart';
import 'package:amikom_wan/pages/widget/app_form_field.dart';
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
                  ),
                  const SizedBox(height: 48),
                  AppButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
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

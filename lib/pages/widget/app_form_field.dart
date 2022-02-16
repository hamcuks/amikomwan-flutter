import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool secret;
  final TextEditingController controller;

  const AppFormField({
    Key? key,
    required this.controller,
    this.hintText = 'Field Name',
    this.icon,
    this.secret = false,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) =>
          value!.isEmpty ? '${widget.hintText} Harus Diisi' : null,
      obscureText: widget.secret,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, size: 18),
        prefixStyle: const TextStyle(color: Color(0xFFA39CB8)),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFA39CB8),
          fontSize: 12,
        ),
        filled: true,
        fillColor: const Color(0xFFF3F9FE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

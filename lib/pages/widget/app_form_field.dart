part of 'widgets.dart';

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
        focusColor: const Color(0xFF442C79),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: const Color(0xFF442C79).withOpacity(.8),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 252, 66, 81).withOpacity(.8),
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

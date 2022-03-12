part of 'widgets.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color color;

  const AppButton({
    Key? key,
    required this.onPressed,
    this.text = 'Text Button',
    this.isLoading = false,
    this.color = const Color(0xFF442C79),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 54,
      child: TextButton(
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Color(0xFFF3F3F3),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Color(0xFFF3F3F3),
                ),
              ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          textStyle: const TextStyle(
            color: Color(0xFFF3F3F3),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

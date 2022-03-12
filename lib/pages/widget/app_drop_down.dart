part of 'widgets.dart';

class AppDropdown extends StatefulWidget {
  final List<String> data;
  final String hintText;
  final bool isExpanded;
  final Function(String) onChanged;

  const AppDropdown({
    Key? key,
    required this.data,
    required this.hintText,
    this.isExpanded = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton(
        value: _value,
        style: const TextStyle(color: Colors.white),
        dropdownColor: const Color(0xFF432A79),
        borderRadius: BorderRadius.circular(4),
        underline: null,
        hint: Text(
          widget.hintText,
          style: const TextStyle(color: Colors.white),
        ),
        isExpanded: widget.isExpanded,
        items: widget.data
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) {
          _value = value.toString();
          widget.onChanged(_value.toString());
          setState(() {});
        },
      ),
    );
  }
}

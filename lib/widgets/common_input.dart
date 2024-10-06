import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  final String label;
  final String? hint;
  final TextInputAction? textInputAction;

  const CommonInput({super.key, required this.label, this.hint, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Color(0xFF7C7C7C)),
        ),
        const SizedBox(height: 10),
        TextField(
          textInputAction: textInputAction,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
          ),
        ),
        const Divider(height: 1, color: Color(0xFFE2E2E2))
      ],
    );
  }
}

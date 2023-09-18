import 'package:flutter/material.dart';

class EmailDetectionTextField extends StatelessWidget {
  const EmailDetectionTextField({super.key, this.onChanged});
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Enter an email to Check',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

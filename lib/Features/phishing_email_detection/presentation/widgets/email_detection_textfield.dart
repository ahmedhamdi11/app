import 'package:app/core/constants/constants.dart';
import 'package:app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';

class EmailDetectionTextField extends StatefulWidget {
  const EmailDetectionTextField({super.key, this.onChanged});
  final Function(String)? onChanged;

  @override
  State<EmailDetectionTextField> createState() =>
      _EmailDetectionTextFieldState();
}

class _EmailDetectionTextFieldState extends State<EmailDetectionTextField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        DefaultTextField(
          onChanged: widget.onChanged,
          controller: _controller,
          maxLines: 6,
          hintText: 'Enter an email to scan...',
        ),
        Positioned(
          top: -22,
          right: -22,
          child: MaterialButton(
            color: kRedColor,
            shape: const CircleBorder(),
            onPressed: () => _controller.clear(),
            child: const Icon(
              Icons.close_rounded,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}

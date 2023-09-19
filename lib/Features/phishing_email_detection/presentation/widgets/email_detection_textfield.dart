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
        TextField(
          controller: _controller,
          onChanged: widget.onChanged,
          maxLines: 6,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Enter an email to Check',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        Positioned(
          top: -22,
          right: -22,
          child: MaterialButton(
            color: Colors.red.withOpacity(0.9),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      inputFormatters: [
        FilteringTextInputFormatter.deny(' '),
      ],
      obscureText: obscureText,
      controller: controller,
      placeholder: placeholder,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

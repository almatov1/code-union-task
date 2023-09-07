import 'package:code_union_task/core/component/theme/colors.dart';
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
      placeholderStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: StandartColors.grey),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

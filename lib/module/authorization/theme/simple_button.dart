import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    required this.onPressed,
    required this.placeholder,
  }) : super(key: key);
  final void Function() onPressed;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: StandartColors.purpleHeart,
        onPressed: onPressed,
        child: Text(
          placeholder,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}

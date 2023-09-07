import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:flutter/material.dart';

class StandartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const StandartAppbar({
    Key? key,
    required this.placeholder,
  }) : super(key: key);
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: StandartColors.approxWhite,
      title: Text(
        placeholder,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

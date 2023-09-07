import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  final List items = [
    {
      'label': 'Лента',
      'icon': 'assets/img/profile/tape.svg',
    },
    {
      'label': 'Карта',
      'icon': 'assets/img/profile/map.svg',
    },
    {
      'label': 'Избранные',
      'icon': 'assets/img/profile/hearth.svg',
    },
    {
      'label': 'Профиль',
      'icon': 'assets/img/profile/small_user.svg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: 3,
      selectedItemColor: StandartColors.purpleHeart,
      unselectedItemColor: StandartColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      items: [
        for (Map item in items)
          BottomNavigationBarItem(
            backgroundColor: StandartColors.white,
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: SvgPicture.asset(
                item['icon'],
              ),
            ),
            label: item['label'],
          ),
      ],
    );
  }
}

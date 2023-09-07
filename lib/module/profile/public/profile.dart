import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:code_union_task/module/profile/service/logout.dart';
import 'package:code_union_task/module/profile/theme/bottom_navigation.dart';
import 'package:code_union_task/module/shared/theme/standart_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final Widget userIcon = SizedBox(
    width: 64,
    height: 64,
    child: SvgPicture.asset('assets/img/profile/user.svg'),
  );

  buildLogoutSection({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Container(
        color: StandartColors.approxWhite,
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Logout.exec(context: context);
                },
                child: Text(
                  'Выйти',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandartAppbar(placeholder: 'Профиль'),
      body: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: Column(children: [
          userIcon,
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 12),
            child: Text(
              context.read<AccountBloc>().state.authorization!.user!.nickname!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Text(
            context.read<AccountBloc>().state.authorization!.user!.email!,
            style: GoogleFonts.manrope().copyWith(
              fontWeight: FontWeight.w400,
              color: StandartColors.suvaGrey,
              fontSize: 16.0,
            ),
          ),
          buildLogoutSection(context: context)
        ]),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

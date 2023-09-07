import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/core/component/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.getHexColor('#FEFEFE'),
        title: Text(
          'Профиль',
          style: GoogleFonts.manrope().copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 15.0,
            wordSpacing: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: Column(children: [
          SizedBox(
              width: 64,
              height: 64,
              child: SvgPicture.asset('assets/img/profile/user.svg')),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 12),
            child: Text(
              context.read<AccountBloc>().state.authorization!.user!.nickname!,
              style: GoogleFonts.manrope().copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 24.0,
                wordSpacing: 40.0,
              ),
            ),
          ),
          Text(
            context.read<AccountBloc>().state.authorization!.user!.email!,
            style: GoogleFonts.manrope().copyWith(
              fontWeight: FontWeight.w400,
              color: HexColor.getHexColor('#929292'),
              fontSize: 16.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27),
            child: Container(
              color: HexColor.getHexColor('#FEFEFE'),
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
                        context.read<AccountBloc>().add(AccountLogoutEvent());

                        context.go('/');
                      },
                      child: Text(
                        'Выйти',
                        style: GoogleFonts.manrope().copyWith(
                          fontWeight: FontWeight.w400,
                          color: HexColor.getHexColor('#EC3A4D'),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: 3,
          selectedItemColor: HexColor.getHexColor('#4631D2'),
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.manrope().copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10.0,
          ),
          unselectedLabelStyle: GoogleFonts.manrope().copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10.0,
          ),
          items: [
            BottomNavigationBarItem(
              backgroundColor: HexColor.getHexColor('#FFFFFF4D'),
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: SvgPicture.asset(
                  'assets/img/profile/tape.svg',
                ),
              ),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: SvgPicture.asset(
                  'assets/img/profile/map.svg',
                ),
              ),
              label: 'Карта',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: SvgPicture.asset(
                  'assets/img/profile/hearth.svg',
                ),
              ),
              label: 'Избранные',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: SvgPicture.asset(
                  'assets/img/profile/small_user.svg',
                ),
              ),
              label: 'Профиль',
            ),
          ]),
    );
  }
}

import 'package:code_union_task/module/authorization/data/api/api.dart';
import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/core/component/utils/hex_color.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:code_union_task/module/shared/data/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

@pragma('vm:entry-point')
Route<Object?> _dialogBuilder({
  required BuildContext context,
  required bool success,
}) {
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Title'),
        content: const Text('Content'),
        actions: <Widget>[
          Text(success ? 'Success' : 'Unsuccess'),
        ],
      );
    },
  );
}

confirmAuthorization(
    {required Login login, required BuildContext context}) async {
  http.Response response = await authorization(login: login);
  if (!context.mounted) return;

  if (response.statusCode != 500) {
    print('error: ${response.statusCode}');

    _dialogBuilder(context: context, success: false);
  } else {
    print(response.body);

    context.read<AccountBloc>().add(
          AccountAuthorizationEvent(
            Authorization(
              tokens: Tokens(accessToken: "", refreshToken: ""),
              user: User(id: 1, email: "", nickname: ""),
            ),
          ),
        );

    _dialogBuilder(context: context, success: true);

    context.go('/profile');
  }
}

class Auth extends StatelessWidget {
  Auth({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.getHexColor('#FEFEFE'),
        title: Text(
          'Авторизация',
          style: GoogleFonts.manrope().copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 15.0,
            wordSpacing: 20.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: HexColor.getHexColor('#FEFEFE'),
            height: 123,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    child: SizedBox(
                      height: 22,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Логин или почта',
                          hintStyle: GoogleFonts.manrope().copyWith(
                            fontWeight: FontWeight.w400,
                            color: HexColor.getHexColor('#C3C3C3'),
                            fontSize: 16.0,
                            wordSpacing: 24.0,
                          ),
                        ),
                        style: GoogleFonts.manrope().copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16.0,
                          wordSpacing: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: HexColor.getHexColor('#E0E6ED'), height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    child: SizedBox(
                      height: 22,
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Пароль',
                          hintStyle: GoogleFonts.manrope().copyWith(
                            fontWeight: FontWeight.w400,
                            color: HexColor.getHexColor('#C3C3C3'),
                            fontSize: 16.0,
                            wordSpacing: 24.0,
                          ),
                        ),
                        style: GoogleFonts.manrope().copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16.0,
                          wordSpacing: 24.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor.getHexColor('#4631D2'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                  onPressed: () {
                    confirmAuthorization(
                      login: Login(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                      context: context,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Войти',
                      style: GoogleFonts.manrope().copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16.0,
                        wordSpacing: 24.0,
                      ),
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor.getHexColor('#4631D2'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Регистрация',
                      style: GoogleFonts.manrope().copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16.0,
                        wordSpacing: 24.0,
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

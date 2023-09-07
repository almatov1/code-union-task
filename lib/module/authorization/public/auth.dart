import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:code_union_task/module/authorization/service/confirm_authorization.dart';
import 'package:code_union_task/module/authorization/theme/input_field.dart';
import 'package:code_union_task/module/authorization/theme/simple_button.dart';
import 'package:code_union_task/module/shared/theme/standart_appbar.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  Auth({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final Widget inputSection = Container(
    height: 123,
    color: StandartColors.approxWhite,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputField(
            controller: emailController,
            placeholder: 'Логин или почта',
          ),
          Divider(color: StandartColors.approxSolitudeMinimal, height: 1),
          InputField(
            controller: passwordController,
            placeholder: 'Пароль',
            obscureText: true,
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandartAppbar(placeholder: 'Авторизация'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputSection,
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SimpleButton(
              onPressed: () {
                ConfirmAuthorization.exec(
                  login: Login(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                  context: context,
                );
              },
              placeholder: 'Войти',
            ),
          ),
          const SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SimpleButton(
              onPressed: () {},
              placeholder: 'Зарегистрироваться',
            ),
          )
        ],
      ),
    );
  }
}

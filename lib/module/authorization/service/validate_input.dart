import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:code_union_task/module/authorization/data/model/validate_result.dart';
import 'package:code_union_task/module/authorization/service/validate_format.dart';

class ValidateInput {
  static ValidateResult validate({required Login login}) {
    if (login.email.isEmpty) {
      return ValidateResult(message: 'Заполните почту', result: false);
    }

    bool emailResult = ValidateFormat.validateMail(string: login.email);
    if (!emailResult) {
      return ValidateResult(
          message: 'Неправильный формат почты', result: false);
    }

    if (login.password.isEmpty) {
      return ValidateResult(message: 'Заполните пароль', result: false);
    }

    bool passwordResult =
        ValidateFormat.validatePassword(string: login.password);
    if (!passwordResult) {
      return ValidateResult(
          message: 'Пароль должен содержать больше 7 символов', result: false);
    }

    return ValidateResult(message: '', result: true);
  }
}

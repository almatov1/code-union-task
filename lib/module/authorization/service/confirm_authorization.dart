import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/module/authorization/data/api/api.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:code_union_task/module/authorization/data/model/response_error.dart';
import 'package:code_union_task/module/authorization/data/model/user.dart';
import 'package:code_union_task/module/shared/theme/response_result_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ConfirmAuthorization {
  static exec({required Login login, required BuildContext context}) async {
    try {
      Response response = await authorization(login: login);
      if (!context.mounted) return;

      context.read<AccountBloc>().add(
            AccountAuthorizationEvent(
              Authorization(
                tokens: Tokens(
                  accessToken: response.data['tokens']['accessToken'],
                  refreshToken: response.data['tokens']['refreshToken'],
                ),
                user: User(
                  id: response.data['user']['id'],
                  email: response.data['user']['email'],
                  nickname: response.data['user']['nickname'],
                ),
              ),
            ),
          );
      ResponseResultModal.dialogBuilder(context: context, success: true);

      context.go('/profile');
    } on DioException catch (e) {
      ResponseError errorResponse = ResponseError(
        errors:
            e.response!.statusCode == 500 ? null : e.response!.data['errors'],
        message:
            e.response!.statusCode == 500 ? null : e.response!.data['message'],
        name: e.response!.statusCode == 500 ? null : e.response!.data['name'],
        status:
            e.response!.statusCode == 500 ? null : e.response!.data['status'],
      );

      ResponseResultModal.dialogBuilder(
        context: context,
        success: false,
        error: e.response!.statusCode == 500 ? null : errorResponse.message,
      );
    }
  }
}

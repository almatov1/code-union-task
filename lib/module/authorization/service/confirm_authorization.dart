import 'dart:convert';

import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/module/authorization/data/api/api.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:code_union_task/module/authorization/data/model/response_error.dart';
import 'package:code_union_task/module/authorization/data/model/user.dart';
import 'package:code_union_task/module/shared/theme/response_result_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ConfirmAuthorization {
  static exec({required Login login, required BuildContext context}) async {
    http.Response response = await authorization(login: login);
    if (!context.mounted) return;

    Map jsonCodec = json.decode(response.body);

    if (response.statusCode != 200) {
      ResponseError errorResponse = ResponseError(
        errors: response.statusCode == 500 ? null : jsonCodec['errors'],
        message: response.statusCode == 500 ? null : jsonCodec['message'],
        name: response.statusCode == 500 ? null : jsonCodec['name'],
        status: response.statusCode == 500 ? null : jsonCodec['status'],
      );

      ResponseResultModal.dialogBuilder(
        context: context,
        success: false,
        error: response.statusCode == 500 ? null : errorResponse.message,
      );
    } else {
      context.read<AccountBloc>().add(
            AccountAuthorizationEvent(
              Authorization(
                tokens: Tokens(
                  accessToken: jsonCodec['tokens']['accessToken'],
                  refreshToken: jsonCodec['tokens']['refreshToken'],
                ),
                user: User(
                  id: jsonCodec['user']['id'],
                  email: jsonCodec['user']['email'],
                  nickname: jsonCodec['user']['nickname'],
                ),
              ),
            ),
          );
      ResponseResultModal.dialogBuilder(context: context, success: true);

      context.go('/profile');
    }
  }
}

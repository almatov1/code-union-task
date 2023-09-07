import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/module/shared/theme/response_result_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Logout {
  static exec({required BuildContext context}) {
    context.read<AccountBloc>().add(AccountLogoutEvent());
    ResponseResultModal.dialogBuilder(
      context: context,
      success: true,
    );
    context.go('/');
  }
}

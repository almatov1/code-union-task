import 'package:code_union_task/module/authorization/public/auth.dart';
import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/module/profile/public/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const Widget errorPage = Scaffold(body: Text("404"));

class AppRouter {
  static final GoRouter _router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            path: "/",
            pageBuilder: (context, state) => NoTransitionPage(
                child: context.read<AccountBloc>().state.authorization == null
                    ? Auth()
                    : errorPage)),
        GoRoute(
            path: "/profile",
            pageBuilder: (context, state) => NoTransitionPage(
                child: context.read<AccountBloc>().state.authorization != null
                    ? Profile()
                    : errorPage)),
      ],
      errorPageBuilder: (context, state) =>
          const NoTransitionPage(child: errorPage));

  static GoRouter get router => _router;
}

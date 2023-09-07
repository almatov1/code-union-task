import 'package:code_union_task/core/component/bloc/account/account_bloc.dart';
import 'package:code_union_task/core/config/shared.dart';
import 'package:code_union_task/core/component/route/app_router.dart';
import 'package:code_union_task/core/component/theme/theme_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  final goRouter = AppRouter.router;
  final themeData = ThemeGlobal.themeData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountBloc>(
          create: (context) => AccountBloc(),
        ),
      ],
      child: MaterialApp.router(
        supportedLocales: const [
          Locale('ru'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        title: applicationName,
        theme: themeData,
      ),
    );
  }
}

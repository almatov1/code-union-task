import 'dart:convert';
import 'package:code_union_task/core/config/shared.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:dio/dio.dart';

String sectionPath = 'auth';
final dio = Dio();

authorization({required Login login}) async {
  final response = await dio.post(
    "$backendUrl/$apiUrl/$sectionPath/login",
    data: json.encode(
      {
        'email': login.email,
        'password': login.password,
      },
    ),
  );

  return response;
}

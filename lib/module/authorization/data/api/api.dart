import 'dart:convert';

import 'package:code_union_task/core/config/shared.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:http/http.dart' as http;

String sectionPath = 'auth';

authorization({required Login login}) async {
  var postUri = Uri.parse("$backendUrl/$apiUrl/$sectionPath/login");
  var response = await http.post(
    postUri,
    headers: {"Content-Type": "application/json"},
    body: json.encode(
      {
        'email': login.email,
        'password': login.password,
      },
    ),
  );

  return response;
}

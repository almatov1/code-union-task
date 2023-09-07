import 'package:code_union_task/core/config/shared.dart';
import 'package:code_union_task/module/authorization/data/model/login.dart';
import 'package:http/http.dart' as http;

String sectionPath = 'auth';

authorization({required Login login}) async {
  var postUri = Uri.parse("$backendUrl/$apiUrl/$sectionPath/login");
  var request = http.MultipartRequest("POST", postUri);
  request.fields['email'] = login.email;
  request.fields['password'] = login.password;

  http.StreamedResponse streamedResponse = await request.send();
  http.Response response = await http.Response.fromStream(streamedResponse);

  return response;
}

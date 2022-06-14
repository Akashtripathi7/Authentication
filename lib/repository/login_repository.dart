import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/login_model.dart';

class LoginRepository {
  Future<Response> userLogin({required LoginModel logindata}) async {
    final uri = Uri.parse("https://api.mirakia.com/api/auth/login/");
    Response response = await http.post(uri,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.connectionHeader: 'keep-alive',
        },
        body: jsonEncode(logindata));

    return response;
  }
}

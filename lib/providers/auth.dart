import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(String email, String password, String urlSegment) async {
    final key = dotenv.env['APIKEY'];
    final params = {
      'key': '$key',
    };
    final url = Uri.https('identitytoolkit.googleapis.com', '/v1/accounts:$urlSegment', params);
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(response.body);
  }

  Future<void> signup(String email, String password) async {
    // get API key from https://console.firebase.google.com/project/shop-app-4c7e3/settings/general
    // rest api docs: https://firebase.google.com/docs/reference/rest/auth
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}

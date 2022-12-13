import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    // get API key from https://console.firebase.google.com/project/shop-app-4c7e3/settings/general
    const params = {
      'key': 'AIzaSyDWyi-hyZrOemrzXMjY5KHJwku9b87z6WI',
    };
    final url = Uri.https('identitytoolkit.googleapis.com', '/v1/accounts:signUp', params);
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
}

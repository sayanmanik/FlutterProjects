import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;


  Future<void> authenticate(String email,String password,String urlSegment) async {
        const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyAMNfCDewRFk6Rgm98c6DtnCMv31KHw8PQ';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> login(String email,String password) {
     return authenticate(email,password,'verifyPassword');
  }

  Future<void> signup(String email, String password) async {
    return authenticate(email,password, 'signupNewUser');
  }
}
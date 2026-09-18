import 'dart:convert';
import 'package:flutter_app/core/const/api_constants.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:http/http.dart' as http;

class AuthRepoImplement implements AuthRepo {
  AuthRepoImplement();

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    print(data);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    throw Exception(data['message']);
  }

  @override
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String gender,
  }) async {
    final response = await http.post(
      Uri.parse(ApiConstants.register),
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(data);
      return data;
    }

    throw Exception(data);
  }
}

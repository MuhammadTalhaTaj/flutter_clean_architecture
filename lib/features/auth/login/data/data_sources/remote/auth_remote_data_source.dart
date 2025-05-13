import 'dart:convert';

import 'package:clean_architecture_bloc/core/constants/urls.dart';
import 'package:clean_architecture_bloc/features/auth/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/constants/imports.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> login(String email, String password) async{
    final response =await client.post(
      Uri.parse(Urls.baseUrl+Urls.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      })
    );


    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode == 200|| response.statusCode == 201){
      final data=jsonDecode(response.body);
      return UserModel.fromJson(data);
  }
    else{
      throw Exception('Login failed: ${response.body}');
    }
}}

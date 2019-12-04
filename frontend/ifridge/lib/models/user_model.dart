import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class UserModel extends Model {
  bool isLoading = false;
  Map<String, dynamic> userData = Map();
  Map<String, String> headers = {"Content-type": "application/json"};

  void signUp(Map<String, dynamic> userData, VoidCallback onSuccess,
      VoidCallback onFail) async {
    http.Response response;
    var url = "http://192.168.0.102:9091/users";

    isLoading = true;
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
    String json = jsonEncode(userData);
    response = await http.post(url, headers: headers, body: json);
    // print("RESPONSE: ${response.statusCode}");
    // print("BODY: ${response.body}");
    isLoading = false;
    notifyListeners();
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      onFail();
    }
  }

  signIn(Map<String, dynamic> userData, VoidCallback onSuccess,
      VoidCallback onFail) async {
    http.Response response;
    var url = "http://192.168.0.102:9091/sessions";

    isLoading = true;
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
    String json = jsonEncode(userData);
    response = await http.post(url, headers: headers, body: json);
    // print("RESPONSE: ${response.statusCode}");
    // print("RESPONSE: ${response.body}");

    isLoading = false;
    notifyListeners();
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      onFail();
    }
    var data = jsonDecode(response.body);
    // print(data['token']);
    // print(data['user']['name']);;


    return data;
  }

  void recoverPassword() {}
}

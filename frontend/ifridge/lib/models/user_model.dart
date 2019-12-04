import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class UserModel extends Model {

  bool isLoading = false;
  Map<String, dynamic> userData = Map();
  
  void signUp(Map<String, dynamic> userData, String password, VoidCallback onSuccess, VoidCallback onFail) async{
    isLoading = true;
    notifyListeners();    
  }
  
  void signIn() async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();    
  }

  void recoverPassword(){
    
    
  }

  bool isLoggedIn(){

  }
}
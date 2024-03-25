import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/errors.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends FSGetXController {
  String phone = '';
  String street = '';
  String city = '';
  String firstname = '';
  String lastname = '';
  String email = '';

  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerPass => _controllerPass;

  void changePasswordVisibility() {
    _isVisibilityPass = !_isVisibilityPass;
    update(['Password']);
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter username.";
    } else if (!GetUtils.isUsername(value)) {
      return "Enter a valid username.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter password.";
    }
    if (value.trim().length < 3) {
      return "Password must be at least 3 digits long.";
    }
    return null;
  }

  void onChangeUserName(String? value) {
    _validateBtnContinue();
  }

  void onChangePass(String? value) {
    _validateBtnContinue();
  }

  void _validateBtnContinue() {
    if (_formKey.currentState!.validate()) {
      _isCompleteForm = true;
    } else {
      _isCompleteForm = false;
    }
    update(['BtnLogin']);
  }

  void onLogin() async {
    _isLoading = true;
    update();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    JsonResponseToken response = await postToken(
      EndPoint.login,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
      },
    );
    if(response.statusCode == 200){
      _loginFinish(true);
      TokenJwk.jwk = response.response!.token!;

      Get.toNamed('/home');
    }else{
      _loginFinish(false);
      Errors().errors(response.statusCode,message: 'Your password or username is incorrect');
    }
    _isLoading = false;
    update();
  }

  void goToSignIn() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.toNamed('/signin');
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      final user = users.firstWhere((user) => user['username'] == _controllerName.text.trim(), orElse: () => null);
      if (user != null) {
        phone = user['phone'];
        email = user['email'];
        street = user['address']['street'];
        city = user['address']['city'];
        firstname = user['name']['firstname'];
        lastname = user['name']['lastname'];
      } else {
        // Username not found
        phone = 'Not found';
        street = 'Not found';
        city = 'Not found';
        email = 'Not found';
        firstname = 'Not found';
        lastname = 'Not found';
      }
    } else {
      // Handle errors
      phone = 'Error';
      street = 'Error';
      city = 'Error';
      email = 'Error';
      firstname = 'Error';
      lastname = 'Error';
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Persistence.phone, phone);
    preferences.setString(Persistence.city, city);
    preferences.setString(Persistence.street, street);
    preferences.setString(Persistence.email, email);
    preferences.setString(Persistence.firstname, firstname);
    preferences.setString(Persistence.lastname, lastname);
  }

  void _loginFinish(bool success) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(Persistence.isLogged, success);
    preferences.setBool(Persistence.isInitialFirst, false);
    preferences.setString(Persistence.user, _controllerName.text.trim());
    preferences.setString(Persistence.pass, _controllerPass.text.trim());

    fetchUserData();
  }
}

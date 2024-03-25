import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/errors.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends FSGetXController {
  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerFirstname = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerStreet = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerPass => _controllerPass;
  TextEditingController get controllerFirstname => _controllerFirstname;
  TextEditingController get controllerLastname => _controllerLastname;
  TextEditingController get controllerPhone => _controllerPhone;
  TextEditingController get controllerCity => _controllerCity;
  TextEditingController get controllerStreet => _controllerStreet;

  void goToLogIn() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.toNamed('/login');
  }

  void changePasswordVisibility() {
    _isVisibilityPass = !_isVisibilityPass;
    update(['Password']);
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your username.";
    } else if (!GetUtils.isUsername(value)) {
      return "Enter a valid username.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your email.";
    } else if (!GetUtils.isEmail(value)) {
      return "Enter a valid email.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter your password.";
    }
    if (value.trim().length < 8) {
      return "Your password must be at least 8 digits long.";
    }
    return null;
  }

  void onChangeInput(String? value) {
    _validateBtnCont();
  }

  void _validateBtnCont() {
    if (_formKey.currentState!.validate()) {
      _isCompleteForm = true;
    } else {
      _isCompleteForm = false;
    }
    update(['BtnSignIn']);
  }

  void onSignIn() async {
    _isLoading = true;
    update();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    JsonResponseSingIn response = await postSingIn(
      EndPoint.signIn,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
        'email' : _controllerEmail.text.trim(),
      },
    );
    if(response.statusCode == 200){
      Get.snackbar("Great!", 'Correct registered user with id: ${response.response!.id ?? ''}');

      goToHome();
    }else{
      Errors().errors(response.statusCode,message: 'Some incorrect information.');
    }
    _isLoading = false;
    update();
  }

  void goToHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool(Persistence.isLogged, true);
    preferences.setBool(Persistence.isInitialFirst, false);

    preferences.setString(Persistence.firstname, _controllerFirstname.text.trim());
    preferences.setString(Persistence.lastname, _controllerLastname.text.trim());
    preferences.setString(Persistence.user, _controllerName.text.trim());
    preferences.setString(Persistence.pass, _controllerPass.text.trim());
    preferences.setString(Persistence.email, _controllerEmail.text.trim());
    preferences.setString(Persistence.phone, _controllerPhone.text.trim());
    preferences.setString(Persistence.city, _controllerCity.text.trim());
    preferences.setString(Persistence.street, _controllerStreet.text.trim());

    Get.toNamed('/home');
  }
}

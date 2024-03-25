import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends FSGetXController {
  String _user = '';
  String _pass = '';

  @override
  void onReady() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String lang = preferences.getString(Persistence.lang) ?? 'es';
    preferences.setString(Persistence.lang, lang);

    _validateLogin();
    super.onReady();
  }

  void _validateLogin() async {
    Future.delayed(const Duration(seconds: 3), () {
      _isGuest().then(
        (guest) {
          if (guest) {
            Get.toNamed('/home');
          } else {
            _isInitialFirst().then(
              (initial) {
                if (initial) {
                  Get.toNamed('/presentation');
                } else {
                  Get.toNamed('/home');
                }
              },
            );
          }
        },
      );
    });
  }

  Future<bool> _isLogged() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _user = preferences.getString(Persistence.user) ?? '';
    _pass = preferences.getString(Persistence.pass) ?? '';
    return preferences.getBool(Persistence.isLogged) ?? false;
  }

  Future<bool> _isInitialFirst() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(Persistence.isInitialFirst) ?? true;
  }

  Future<bool> _isGuest() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(Persistence.isGuest) ?? false;
  }
}


import 'package:fakestore/model/network/StatusController.dart';
import 'package:get/get.dart';

class ErrorController extends FSGetXController{
  int _statusCode = 0;
  String _message = '';

  String get message => _message;


  @override
  void onInit() {
    if(Get.arguments['StatusCode'] != null){
      _statusCode = int.tryParse(Get.arguments['StatusCode']!)!;
    }
    _evaluateCode();

    super.onInit();
  }

  void _evaluateCode(){
    switch(_statusCode){
      case 401:
        _message = 'Your password or username is incorrect';
        break;
    }
  }

}
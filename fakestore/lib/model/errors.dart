
import 'package:get/get.dart';

class Errors{

  void errors(int code,{String message = ''}){
    switch(code){
      case 401:
        Get.snackbar('Upss!', message.isEmpty ? 'You are not authorized' : message);
        break;
      case 404:
        Get.snackbar('Upss!', message.isEmpty ? 'Not found' : message);
        break;
      case 0:
        Get.snackbar('Upss!', message.isEmpty ? 'Something went wrong.' : message);
        break;
    }
  }
}
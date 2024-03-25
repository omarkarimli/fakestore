import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:fakestore/model/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends FSGetXController {
  List<Product> _products = [];
  bool _isLoading = true;
  bool _isAsc = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isAsc => _isAsc;

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }

  Future<void> _getProducts() async {
    JsonResponseList response = await getProducts(
      EndPoint.products,
      params: _isAsc ? {'sort': 'desc'} : {},
    );

    if (response.statusCode == 200) {
      _products = response.response;
      update(['ListProducts']);
    }

    _isLoading = false;
    update();

    debugPrint('$response');
  }

  void onChangeAsc() {
    _isAsc = !_isAsc;
    _isLoading = true;
    update();
    _getProducts();
  }

  void onCloseSession() {
    SharedPreferences.getInstance().then((preferences) {
      preferences.setBool(Persistence.isLogged, false);
      preferences.setBool(Persistence.isInitialFirst, true);

      preferences.setString(Persistence.firstname, '');
      preferences.setString(Persistence.lastname, '');
      preferences.setString(Persistence.user, '');
      preferences.setString(Persistence.pass, '');
      preferences.setString(Persistence.email, '');
      preferences.setString(Persistence.phone, '');
      preferences.setString(Persistence.city, '');
      preferences.setString(Persistence.street, '');

      FocusScope.of(Get.context!).requestFocus(FocusNode());
      Get.toNamed('/presentation');
    });
  }

  void goToDetailProduct(String id, Product item) {
    Get.toNamed('/detail_product', arguments: {'id': id, 'product': item});
  }
}

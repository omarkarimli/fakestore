import 'package:fakestore/view/detail_product/detail_product_page.dart';
import 'package:fakestore/view/errors/error_page.dart';
import 'package:fakestore/view/home/home_page.dart';
import 'package:fakestore/view/login/login_page.dart';
import 'package:fakestore/view/presentation/presentation_page.dart';
import 'package:fakestore/view/profile/edit_profile_page.dart';
import 'package:fakestore/view/profile/profile_page.dart';
import 'package:fakestore/view/signin/signin_page.dart';
import 'package:fakestore/view/splash/splash_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: '/signin',
    page: () => const SingInPage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/profile',
    page: () => ProfilePage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/editprofile',
    page: () => EditProfilePage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/detail_product',
    page: () => const DetailProductPage(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/error',
    page: () => const ErrorPage(),
    transition: Transition.cupertinoDialog,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/presentation',
    page: () => const PresentationPage(),
    transition: Transition.circularReveal,
    fullscreenDialog: true,
  ),
];

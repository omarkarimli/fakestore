import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String savedLang = prefs.getString(Persistence.lang) ?? 'en';
  runApp(MyApp(savedLang: savedLang));
}

class MyApp extends StatelessWidget {
  final String savedLang;

  const MyApp({
    Key? key,
    required this.savedLang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FakeStoreApi',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('az', 'AZ'),
        Locale('tr', 'TR'),
      ],
      locale: Locale(savedLang),
      initialRoute: '/',
      getPages: routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          titleSpacing: 0,
          toolbarHeight: 64,
          elevation: 0,
          color: Colors.transparent,
          centerTitle: false,

          iconTheme: IconThemeData(
            color: Colors.black,
            size: 18,
          ),
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Manrope',
            color: Color(0xFF201A1A),
            fontSize: 32,
            fontWeight: FontWeight.w500,
            height: 1.22,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Manrope',
            color: Color(0xFF201A1A),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Manrope',
            color: Color(0xFF201A1A),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.50,
            letterSpacing: 0.15,
          ),

          displayLarge: TextStyle(
            color: Color(0xFF201A1A),
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.50,
            letterSpacing: 0.15,
          ),
          displayMedium: TextStyle(
            color: Color(0xFF201A1A),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.43,
            letterSpacing: 0.25,
          ),
          displaySmall: TextStyle(
            color: Color(0xFF201A1A),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.25,
          ),

          bodyMedium: TextStyle(
            fontFamily: 'Manrope',
            color: Color(0xFF201A1A),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: 0.10,
          ),
        ),
      ),
    );
  }
}

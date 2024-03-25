import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class S {
  S(this.locale);

  final Locale locale;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationDelegate delegate = LocalizationDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Dontyouhaveacco': 'Don´t have an account yet?',
      'Doyouhaveacco': 'Do you have an account?',
      'Register': 'Join now',
      'SignIn': 'Sign In',
      'SignOff': 'Sign Off',
      'Login': 'Login',
      'Email': 'Email',
      'Guest': 'Guest',
      'AppName': 'FakeStore',
      'UserName': 'Username',
      'Password': 'Password',
      'Buy': 'Buy',
      'Price': 'Price',
      'Ratings': 'Ratings',
      'Votes': 'Votes',
      'Description': 'Description',
      'Deleteuser': 'Delete user',
      'Phone': 'Phone',
      'Location': 'Location',
      'Done': 'Done',
      'Edit': 'Edit',
      'Profile': 'Profile',
      'About': 'About',
      'Supportme': 'Support me',
      'Firstname': 'First name',
      'Lastname': 'Last name',
      'City': 'City',
      'Street': 'Street',
      'Language': 'Language',
    },
    'az': {
      'Dontyouhaveacco': 'Hələ hesabınız yoxdur?',
      'Doyouhaveacco': 'Sizin hesabınız var?',
      'Register': 'İndi qoşul',
      'SignIn': 'Daxil ol',
      'SignOff': 'Hesabdan çıx',
      'Login': 'Giriş',
      'Email': 'Email',
      'Guest': 'Qonaq',
      'AppName': 'FakeStore',
      'UserName': 'İstifadəçi adı',
      'Password': 'Parol',
      'Buy': 'Al',
      'Price': 'Qiymət',
      'Ratings': 'Reytinqlər',
      'Votes': 'Səslər',
      'Description': 'Açıqlama',
      'Deleteuser': 'Hesabı sil',
      'Phone': 'Telefon',
      'Location': 'Məkan',
      'Done': 'Bitdi',
      'Edit': 'Redaktə',
      'Profile': 'Hesab',
      'About': 'Haqqında',
      'Supportme': 'Dəstəklə məni',
      'Firstname': 'Ad',
      'Lastname': 'Soyad',
      'City': 'Şəhər',
      'Street': 'Küçə',
      'Language': 'Dil',
    },
    'tr': {
      'Dontyouhaveacco': 'Henüz bir hesabınız yok mu?',
      'Doyouhaveacco': 'Hesabın var mı?',
      'Register': 'Şimdi Katıl',
      'SignIn': 'Girmek',
      'SignOff': 'Oturumu Kapat',
      'Login': 'Girmek',
      'Email': 'Email',
      'Guest': 'Misafir',
      'AppName': 'FakeStore',
      'UserName': 'Kullanıcı adı',
      'Password': 'Şifre',
      'Buy': 'Al',
      'Price': 'Fiyat',
      'Ratings': 'Değerlendirme',
      'Votes': 'Oylar',
      'Description': 'Açıklama',
      'Deleteuser': 'Oturumu sil',
      'Phone': 'Telefon',
      'Location': 'Konum',
      'Done': 'Bitti',
      'Edit': 'Düzenleme',
      'Profile': 'Oturum',
      'About': 'Hakkında',
      'Supportme': 'Destekle Beni',
      'Firstname': 'İsim',
      'Lastname': 'Soyadı',
      'City': 'Şehir',
      'Street': 'Sokak',
      'Language': 'Dil',
    },
  };

  String get language {
    return _localizedValues[locale.languageCode]!['Language'] ?? '';
  }

  String get city {
    return _localizedValues[locale.languageCode]!['City'] ?? '';
  }

  String get street {
    return _localizedValues[locale.languageCode]!['Street'] ?? '';
  }

  String get firstname {
    return _localizedValues[locale.languageCode]!['Firstname'] ?? '';
  }

  String get lastname {
    return _localizedValues[locale.languageCode]!['Lastname'] ?? '';
  }

  String get dontyouhaveacco {
    return _localizedValues[locale.languageCode]!['Dontyouhaveacco'] ?? '';
  }

  String get doyouhaveacco {
    return _localizedValues[locale.languageCode]!['Doyouhaveacco'] ?? '';
  }

  String get supportme {
    return _localizedValues[locale.languageCode]!['Supportme'] ?? '';
  }

  String get about {
    return _localizedValues[locale.languageCode]!['About'] ?? '';
  }

  String get edit {
    return _localizedValues[locale.languageCode]!['Edit'] ?? '';
  }

  String get profile {
    return _localizedValues[locale.languageCode]!['Profile'] ?? '';
  }

  String get done {
    return _localizedValues[locale.languageCode]!['Done'] ?? '';
  }

  String get location {
    return _localizedValues[locale.languageCode]!['Location'] ?? '';
  }

  String get phone {
    return _localizedValues[locale.languageCode]!['Phone'] ?? '';
  }

  String get appName {
    return _localizedValues[locale.languageCode]!['AppName'] ?? '';
  }

  String get signIn {
    return _localizedValues[locale.languageCode]!['SignIn'] ?? '';
  }

  String get signOff {
    return _localizedValues[locale.languageCode]!['SignOff'] ?? '';
  }

  String get login {
    return _localizedValues[locale.languageCode]!['Login'] ?? '';
  }

  String get email {
    return _localizedValues[locale.languageCode]!['Email'] ?? '';
  }

  String get guest {
    return _localizedValues[locale.languageCode]!['Guest'] ?? '';
  }

  String get register {
    return _localizedValues[locale.languageCode]!['Register'] ?? '';
  }

  String get userName {
    return _localizedValues[locale.languageCode]!['UserName'] ?? '';
  }

  String get password {
    return _localizedValues[locale.languageCode]!['Password'] ?? '';
  }

  String get buy {
    return _localizedValues[locale.languageCode]!['Buy'] ?? '';
  }

  String get price {
    return _localizedValues[locale.languageCode]!['Price'] ?? '';
  }

  String get ratings {
    return _localizedValues[locale.languageCode]!['Ratings'] ?? '';
  }

  String get votes {
    return _localizedValues[locale.languageCode]!['Votes'] ?? '';
  }

  String get description {
    return _localizedValues[locale.languageCode]!['Description'] ?? '';
  }

  String get deleteuser {
    return _localizedValues[locale.languageCode]!['Deleteuser'] ?? '';
  }
}

class LocalizationDelegate extends LocalizationsDelegate<S> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'az', 'tr'].contains(locale.languageCode);

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(S(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}

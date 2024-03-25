class Persistence {
  static const String isLogged = "IS_LOGGED";
  static const String user = "USER";
  static const String pass = "PASS";
  static const String isInitialFirst = "IS_INITIAL";
  static const String isGuest = "Is_GUEST";

  static const String phone = "PHONE";
  static const String street = "STREET";
  static const String city = "CITY";
  static const String email = "EMAIL";
  static const String firstname = "FIRSTNAME";
  static const String lastname = "LASTNAME";

  static const String lang = "LANG";
}

class WebService {
  static const String urlBase = "https://fakestoreapi.com";
}

class EndPoint {
  static const String login = "/auth/login";
  static const String signIn = "/users";
  static const String products = "/products";
}

class TokenJwk {
  static String jwk = '';
}

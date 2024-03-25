import 'dart:convert';

SignIn? signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn? data) => json.encode(data!.toJson());

class SignIn {
  SignIn({
    this.id,
  });

  int? id;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

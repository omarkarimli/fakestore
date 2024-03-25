import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController streetController = TextEditingController();

  String username = '';
  String password = '';
  String phone = '';
  String email = '';
  String firstname = '';
  String lastname = '';
  String city = '';
  String street = '';

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cityController.dispose();
    streetController.dispose();

    super.dispose();
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString(Persistence.user) ?? 'Guest';
      password = prefs.getString(Persistence.pass) ?? 'Guest';
      phone = prefs.getString(Persistence.phone) ?? 'Guest';
      email = prefs.getString(Persistence.email) ?? 'Guest';
      firstname = prefs.getString(Persistence.firstname) ?? 'Guest';
      lastname = prefs.getString(Persistence.lastname) ?? 'Guest';
      city = prefs.getString(Persistence.city) ?? 'Guest';
      street = prefs.getString(Persistence.street) ?? 'Guest';

      usernameController.text = username;
      passwordController.text = password;
      phoneController.text = phone;
      emailController.text = email;
      cityController.text = city;
      streetController.text = street;
    });
  }

  void onDone() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(Persistence.user, usernameController.text);
    preferences.setString(Persistence.pass, passwordController.text);
    preferences.setString(Persistence.phone, phoneController.text);
    preferences.setString(Persistence.email, emailController.text);
    preferences.setString(Persistence.city, cityController.text);
    preferences.setString(Persistence.street, streetController.text);

    Get.toNamed('/profile');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          '${S.of(context)!.edit} ${S.of(context)!.profile}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/profile');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Column(
                children: [
                  const Icon(Icons.account_circle_rounded, size: 96,),
                  Text(
                    '$firstname $lastname',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 26),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
                    child: ColoredBox(
                      color: Colors.black12,
                      child: SizedBox(
                        width: double.infinity,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.userName,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.password,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16,),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.phone,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.email,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16,),
                    TextField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.city,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 16,),
                    TextField(
                      controller: streetController,
                      decoration: InputDecoration(
                        labelText: S.of(context)!.street,
                        labelStyle: Theme.of(context).textTheme.titleSmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: TextButton(
                        onPressed: onDone,
                        child: Text(
                          S.of(context)!.done,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
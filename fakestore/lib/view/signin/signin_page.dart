import 'package:fakestore/controller/sign_in/signin_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.toNamed('/presentation');
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ProgressHUD(
              loading: _.isLoading,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Image.asset(
                              Utils().imageLogoAsset,
                              height: 256,
                            ),
                            TextField(
                              controller: _.controllerFirstname,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
                              decoration: InputDecoration(
                                labelText: S.of(context)!.firstname,
                                labelStyle: Theme.of(context).textTheme.titleSmall,
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                                ),
                              ),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerLastname,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
                              decoration: InputDecoration(
                                labelText: S.of(context)!.lastname,
                                labelStyle: Theme.of(context).textTheme.titleSmall,
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                                ),
                              ),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerName,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
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
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerEmail,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
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
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<SignInController>(
                              id: 'Password',
                              builder: (_) {
                                return TextField(
                                  controller: _.controllerPass,
                                  keyboardType: TextInputType.text,
                                  onChanged: _.onChangeInput,
                                  obscureText: !_.isVisibilityPass,
                                  obscuringCharacter: '*',
                                  decoration: InputDecoration(
                                    labelText: S.of(context)!.password,
                                    labelStyle: Theme.of(context).textTheme.titleSmall,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: !_.isVisibilityPass
                                          ? const Icon(Icons.visibility_off_outlined)
                                          : const Icon(Icons.visibility_outlined),
                                      onPressed: _.changePasswordVisibility,
                                    ),
                                  ),
                                  style: Theme.of(context).textTheme.titleSmall,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerPhone,
                              keyboardType: TextInputType.phone,
                              onChanged: _.onChangeInput,
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
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerCity,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
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
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _.controllerStreet,
                              keyboardType: TextInputType.text,
                              onChanged: _.onChangeInput,
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
                            const SizedBox(
                              height: 25,
                            ),
                            GetBuilder<SignInController>(
                                id: 'BtnSignIn',
                                builder: (_) {
                                  return Container(
                                    height: 48,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _.isCompleteForm
                                          ? () => _.onSignIn()
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        S.of(context)!.signIn,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => _.goToLogIn(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context)!.doyouhaveacco,
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    ' ${S.of(context)!.login}',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: FSColors.purple),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

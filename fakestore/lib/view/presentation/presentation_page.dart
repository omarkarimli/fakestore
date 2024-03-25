import 'package:fakestore/controller/presentation/presentation_controller.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PresentationController>(
      init: PresentationController(),
      builder: (_) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Utils().imageLogoAsset,
                  height: 256,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 3,
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () => _.goToHome(),
                    child: Text(
                      S.of(context)!.guest,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87,
                  ),
                  child: TextButton(
                    onPressed: () => _.goToLogin(),
                    child: Text(
                      S.of(context)!.login,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple,
                  ),
                  child: TextButton(
                    onPressed: () => _.goToSignin(),
                    child: Text(
                      S.of(context)!.signIn,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

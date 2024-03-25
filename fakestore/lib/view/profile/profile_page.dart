import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String lang = '';

  String username = '';
  String password = '';
  String phone = '';
  String city = '';
  String street = '';
  String email = '';
  String firstname = '';
  String lastname = '';

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lang = prefs.getString(Persistence.lang) ?? 'es';

      username = prefs.getString(Persistence.user) ?? 's';
      password = prefs.getString(Persistence.pass) ?? 's';
      phone = prefs.getString(Persistence.phone) ?? 's';
      city = prefs.getString(Persistence.city) ?? 's';
      street = prefs.getString(Persistence.street) ?? 's';
      email = prefs.getString(Persistence.email) ?? 's';
      firstname = prefs.getString(Persistence.firstname) ?? 's';
      lastname = prefs.getString(Persistence.lastname) ?? 's';
    });
  }

  void setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString(Persistence.lang, lang);
    });
  }

  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(188),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.toNamed('/home');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context)!.profile,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 26.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 72,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 72,
                                  padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.account_circle_rounded,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  username,
                                                  style: Theme.of(context).textTheme.displaySmall,
                                                ),
                                              ),
                                              Expanded(child: Text(
                                                email,
                                                style: Theme.of(context).textTheme.titleSmall,
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () { Get.toNamed('/editprofile'); },
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 72,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 72,
                                  padding: const EdgeInsets.only(top: 8, left: 16, right: 24, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.key_rounded,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  S.of(context)!.password,
                                                  style: Theme.of(context).textTheme.displaySmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  password,
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.dialog(
                                Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.updateLocale(const Locale('en'));
                                            setLang('en');
                                            Get.toNamed('home');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              'English',
                                              style: lang=='en' ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.updateLocale(const Locale('az'));
                                            setLang('az');
                                            Get.toNamed('home');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              'Azərbaycanca',
                                              style: lang=='az' ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.updateLocale(const Locale('tr'));
                                            setLang('tr');
                                            Get.toNamed('home');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              'Türkçe',
                                              style: lang=='tr' ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 72,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 72,
                                    padding: const EdgeInsets.only(top: 8, left: 16, right: 24, bottom: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.language,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Container(
                                            height: double.infinity,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    S.of(context)!.language,
                                                    style: Theme.of(context).textTheme.displaySmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    lang=='az' ? 'Azərbaycanca' : (lang=='tr' ? 'Türkçe' : 'English'),
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ),
                                              ],
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
                          SizedBox(
                            width: double.infinity,
                            height: 72,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 72,
                                  padding: const EdgeInsets.only(top: 8, left: 16, right: 24, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.local_phone_outlined,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  S.of(context)!.phone,
                                                  style: Theme.of(context).textTheme.displaySmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  phone,
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 72,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 72,
                                  padding: const EdgeInsets.only(top: 8, left: 16, right: 24, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.place_rounded,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  S.of(context)!.location,
                                                  style: Theme.of(context).textTheme.displaySmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '$city | $street',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 72,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 72,
                                  padding: const EdgeInsets.only(top: 8, left: 16, right: 24, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.info_outline_rounded,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  S.of(context)!.about,
                                                  style: Theme.of(context).textTheme.displaySmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  'fakestore app to vrmedia',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Container(
                        height: 448,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFCCE3F3), Colors.white], // Gradient
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 28, 0, 0),
                          child: Stack(
                            children: [
                              Positioned(
                                right: -32,
                                bottom: -64,
                                child: ClipRRect(
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.5),
                                      BlendMode.dstIn,
                                    ),
                                    child: Image.asset(
                                      'assets/images/abstract1.png',
                                      width: 256,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context)!.supportme,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 12,),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap:  () => setState(() {
                                          final Uri toLaunch = Uri(scheme: 'https', host: 'www.instagram.com', path: '_vienss/');
                                          _launched = _launchInBrowser(toLaunch);
                                        }),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 72,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 72,
                                                padding: const EdgeInsets.only(top: 8, right: 24, bottom: 8),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/instagram.png',
                                                        width: 20,
                                                        color: Colors.grey.shade900,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Expanded(
                                                      child: Container(
                                                        height: double.infinity,
                                                        clipBehavior: Clip.antiAlias,
                                                        decoration: const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                'Instagram',
                                                                style: Theme.of(context).textTheme.displaySmall,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                '@_vienss',
                                                                style: Theme.of(context).textTheme.titleSmall,
                                                              ),
                                                            ),
                                                          ],
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
                                      GestureDetector(
                                        onTap:  () => setState(() {
                                          final Uri toLaunch = Uri(scheme: 'https', host: 'www.linkedin.com', path: '/in/omar-kerimli-7o7');
                                          _launched = _launchInBrowser(toLaunch);
                                        }),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 72,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 72,
                                                padding: const EdgeInsets.only(top: 8, right: 24, bottom: 8),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/linkedin.png',
                                                        width: 20,
                                                        color: Colors.grey.shade900,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Expanded(
                                                      child: Container(
                                                        height: double.infinity,
                                                        clipBehavior: Clip.antiAlias,
                                                        decoration: const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                'LinkedIn',
                                                                style: Theme.of(context).textTheme.displaySmall,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                '@omar-kerimli-7o7',
                                                                style: Theme.of(context).textTheme.titleSmall,
                                                              ),
                                                            ),
                                                          ],
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
                                      GestureDetector(
                                        onTap:  () => setState(() {
                                          final Uri toLaunch = Uri(scheme: 'https', host: 'www.patreon.com', path: '/vienss/');
                                          _launched = _launchInBrowser(toLaunch);
                                        }),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 72,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 72,
                                                padding: const EdgeInsets.only(top: 8, right: 24, bottom: 8),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/patreon.png',
                                                        width: 20,
                                                        color: Colors.grey.shade900,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Expanded(
                                                      child: Container(
                                                        height: double.infinity,
                                                        clipBehavior: Clip.antiAlias,
                                                        decoration: const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                'Patreon',
                                                                style: Theme.of(context).textTheme.displaySmall,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: Text(
                                                                '@vienss',
                                                                style: Theme.of(context).textTheme.titleSmall,
                                                              ),
                                                            ),
                                                          ],
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
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
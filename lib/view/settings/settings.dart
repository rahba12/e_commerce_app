import 'package:e_commerce_app/shared/constants.dart';
import 'package:e_commerce_app/translations/local_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;

  // saveDropdownValue(String dropdownValue) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('dropdownValue', dropdownValue);
  // }
  //
  // Future<String?> getDropdownValue() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('dropdownValue');
  // }
  //
  // String dropdownValue = 'English';
  // static final langs = [
  //   'English',
  //   'Arabic',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.volume_up,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Push notification',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const Spacer(),
                    Transform.scale(
                        scale: 1,
                        child: Switch(
                          onChanged: (bool value) {
                            if (isSwitched == false) {
                              setState(() {
                                isSwitched = true;
                              });
                            } else {
                              setState(() {
                                isSwitched = false;
                              });
                            }
                          },
                          value: isSwitched,
                          activeColor: Colors.white,
                          activeTrackColor: primaryColor,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Divider(
                    height: 3,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      LocaleKeys.language.tr(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    // Row(children: <Widget>[
                    //   DropdownButton<String>(
                    //     dropdownColor: Colors.white,
                    //     value: dropdownValue,
                    //     style: const TextStyle(color: Colors.black),
                    //     underline: Container(
                    //       padding: const EdgeInsets.only(left: 4, right: 4),
                    //       color: Colors.transparent,
                    //     ),
                    //     items:
                    //         langs.map<DropdownMenuItem<String>>((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(
                    //           value,
                    //           style: const TextStyle(
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w600,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         if (newValue == 'English') {
                    //           setState(() {
                    //             dropdownValue = newValue!;
                    //             getDropdownValue();
                    //             context.locale = const Locale('en');
                    //           });
                    //         } else if (newValue == "Arabic") {
                    //           setState(() {
                    //             dropdownValue = newValue!;
                    //             getDropdownValue();
                    //             context.locale = const Locale('ar');
                    //           });
                    //           print(
                    //             "language".tr(),
                    //           );
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ]),
                    ElevatedButton(
                        onPressed: () async {
                          await context.setLocale(const Locale('en'));
                        },
                        child: const Text('English')),
                    ElevatedButton(
                      onPressed: () async {
                        await context.setLocale(const Locale('ar'));
                      },
                      child: const Text(
                        "العربية",
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Divider(
                    height: 3,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

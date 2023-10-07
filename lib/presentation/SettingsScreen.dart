import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui';
import '../localization/languageDropDown.dart';
import '../localization/language_constants.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool enableAppLock = false;
  late String appPin;
  bool loading = false;
  bool hidePassword = true;
  bool notification =false;
  bool applock=false;
  late bool accountType;

  @override
  void initState() {
    super.initState();
  }

  void _changeLanguage(Language language) async {
    debugPrint('test lang 2: ${language.languageCode}');
    Locale locale = await setLocale(language.languageCode);
    debugPrint('test lang 7: ${locale.languageCode}');
    updateLanguage(locale);
  }
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white, shadowColor: Colors.pink, elevation: 2,
        title: Text(
        'settings'.tr,
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          // width: 150,
                          child: DropdownButton<Language>(
                        underline: Container(color: Colors.transparent),
                        isExpanded: true,
                        iconSize: 30,
                        hint: Text(
                          'change_language'.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black),
                        ),
                        onChanged: (Language? language) {
                          buildLoadingDialog(context);
                          debugPrint('test lang 1: ${language!.languageCode}');
                          Future.delayed(const Duration(milliseconds: 400), () {
                            _changeLanguage(language);
                          });
                          Future.delayed(const Duration(milliseconds: 1000), () {
                            // Navigator.of(context).pop(false);
                          }); //
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        e.flag,
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      Text(e.defaultLanguage),
                                      Text(e.name)
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.pink.shade900,
              endIndent: 10,
              indent: 10,
              thickness: 0.25,
            ),
           /* InkWell(
              onTap: () {
                showAccountTypeDialog();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 24),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                       'Switch_toPersonal'.tr,
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.swap_horiz_rounded,
                      color: Colors.pink.shade900,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),*/
        /*    Divider(
              color: Colors.pink.shade900,
              endIndent: 10,
              indent: 10,
              thickness: 0.25,
            ),*/
           /*  SwitchListTile(
              activeColor: Colors.pink.shade900,
              onChanged: (val) {
                setState(() {
                  notification=!notification;
                });

                onClickNotification(val);
              },
              value: notification,
              title: Text(
                "Transaction_notification".tr,
                style: GoogleFonts.poppins(),
              ),
            ),
            Divider(
              color: Colors.pink.shade900,
              endIndent: 10,
              indent: 10,
              thickness: 0.25,
            ),*/
           /* Container(
              child: SwitchListTile(
                activeColor: Colors.pink.shade900,
                onChanged: (val) {
                  setState(() {
                    applock = !applock;
                  });
                  // onClickEnableAppLock(enableAppLock);
                },
                value: applock,
                title: Text(
                  "AppLock".tr,
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),*/
            applock
                ? Container(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              width: 24,
                            ),
                            Container(
                              child: Expanded(
                                child: Form(
                                  key: formkey,
                                  child: Container(
                                    child: TextFormField(
                                      initialValue: "",
                                      maxLength: 4,
                                      decoration: InputDecoration(
                                          labelText:'AppPin'.tr,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(4.0),
                                            borderSide:
                                            const BorderSide(width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.pink.shade900),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          suffixIcon: GestureDetector(
                                            child: Icon(
                                              hidePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                hidePassword = !hidePassword;
                                              });
                                            },
                                          )),
                                      onChanged: (val) {appPin = val.trim();},
                                      validator: (val) {
                                        if (val?.trim().length == 4) {
                                          return null;
                                        } else {
                                          return "Invalid";
                                        }
                                      },
                                      obscureText: hidePassword,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: Colors.pink.shade900,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () {
                                  onClickSaveAppPin();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "Save".tr,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                          ],
                        ),
                       /* widget.user.appPin != null
                            ? widget.user.appPin != ''
                                ? SwitchListTile(
                                    onChanged: (val) {
                                      onClickEnableBiometric(val);
                                    },
                                    value: widget.user.enableBiometric,
                                    activeColor: Colors.pink.shade900,
                                    title: Text(
                                      // "Biometric",
                                      '${getTranslated(context, 'Biometric')}',

                                      style: GoogleFonts.poppins(),
                                    ),
                                  )
                                : Container()
                            : Container(),*/
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 16,
            ),
            loading
                ? Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Future buildLoadingDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0.7),
      barrierDismissible: false,
      // barrierLabel: "Dialog",
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/greenRoute.png',
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              SpinKitWave(
                type: SpinKitWaveType.start,
                size: 24,
                itemCount: 6,
                color: Colors.pink.shade900,
              )
            ],
          ),
        );
      },
    );
  }

  onClickNotification(bool val) async {/*
    try {
      setState(() {
        widget.user.enableNotification = val;
      });
      await DatabaseService().updateNotificationStatus(widget.user);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          widget.user.enableNotification
              ?
          // ? "Notifications enabled"
          // : "Notifications Disabled"
          '${getTranslated(context, 'NotificationEnabled')}'
              : '${getTranslated(context, 'NotificationDisabled')}',
        ),
      ));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(widget.user.enableNotification
            ? "Error occurred  while enabling notification"
            : "Error occurred while disabling notifications"),
      ));
    }
  */
  }

  onClickAccountType() async {/*
    try {
      setState(() {
        widget.user.accountType = widget.user.accountType == 1 ? 2 : 1;
        print(widget.user.accountType);
      });
      await DatabaseService().updateAccountType(widget.user);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          widget.user.accountType == 1
          // ? "Account type updated to Personal"
          // : "Account type updated to Business"
              ? '${getTranslated(context, 'SnackBarPersonal')}'
              : '${getTranslated(context, 'SnackBarBusiness')}',
        ),
      ));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error occurred"),
      ));
    }
  */}

  onClickEnableAppLock(bool value) {/*
    try {
      if (value) {
        if (widget.user.appPin != null) {
          if (widget.user.appPin != '') {
            widget.user.enableAppLock = value;
            DatabaseService().updateAppLockStatus(widget.user);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                widget.user.enableAppLock
                    // ? "App lock enabled"
                    // : "App lock Disabled"
                    ? '${getTranslated(context, 'AppLockEnable')}'
                    : '${getTranslated(context, 'AppLockDisabled')}',
              ),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please set your pin"),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please set your pin"),
          ));
        }
      } else {
        widget.user.enableAppLock = value;
        DatabaseService().updateAppLockStatus(widget.user);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            widget.user.enableAppLock
                // ? "App lock enabled"
                // : "App lock Disabled"
                ? '${getTranslated(context, 'AppLockEnable')}'
                : '${getTranslated(context, 'AppLockDisabled')}',
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error occured "),
      ));
    }
 */ }

  onClickSaveAppPin() async {
    /*
    try {
      if (formkey.currentState!.validate()) {
        setState(() {
          loading = true;
          widget.user.enableAppLock = true;
        });
        widget.user.appPin = appPin;
        await DatabaseService().updateAppPin(widget.user);
        await DatabaseService()
            .updateAppLockStatus(widget.user)
            .then((value) => setState(() {
                  widget.user.appPin = appPin;
                  // widget.user.enableAppLock = true;
                  loading = false;
                  FocusScope.of(context).unfocus();
                }));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Pin Saved"),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error occured "),
      ));
    }
 */
  }

  onClickEnableBiometric(bool val) async {/*
    try {
      setState(() {
        widget.user.enableBiometric = val;
      });
      await DatabaseService().updateBiometricStatus(widget.user);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(widget.user.enableBiometric
            ? "Biometric enabled"
            : "Biometric Disabled"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error occured "),
      ));
    }
 */ }

  showAccountTypeDialog() async {/*
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          widget.user.accountType == 1
              // ? "Your account type will be changed to Business"
              // : "Your account type will be changed to Personal",
              ? '${getTranslated(context, 'Switch_toBusiness')}'
              : '${getTranslated(context, 'Switch_toPersonal')}',
          style:
              GoogleFonts.openSans(fontSize: 18, color: Colors.grey.shade700),
        ),
        // content: Text(
        //   "Your account type will be changed to",
        //   style:
        //   GoogleFonts.openSans(fontSize: 18, color: Colors.grey.shade700),
        // ),

        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey.shade200,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            onPressed: () async {
              onClickAccountType();
              Navigator.pop(context);
            },
            child: Text(
              "Ok",
              style: GoogleFonts.openSans(color: Colors.black87),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey.shade200,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.openSans(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  */}
}

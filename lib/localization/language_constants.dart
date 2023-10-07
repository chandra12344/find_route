import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String english = 'en';
const String hindi = 'hi';
const String spanish = 'es';
const String french = 'fr';
const String kannada = 'kn';
const String malayam = 'ml';
const String portugeese = 'pt';
const String telgu = 'te';

Future<Locale> setLocale(String languageCode) async {
  debugPrint('test lang 3:$languageCode');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint('test lang 4:$prefs');
  await prefs.setString(languageCode, languageCode);
  debugPrint('test lang 5:${prefs.getString(languageCode)}');
  return _locale(languageCode);
}
Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint('test lang 11:$prefs');
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? "en";
  debugPrint('test lang 12:$LANGUAGE_CODE');
  return _locale(LANGUAGE_CODE);
}

Locale _locale(String languageCode) {
  debugPrint('test lang 6:$languageCode');
  switch (languageCode) {
    case english:
      return  const Locale(english, 'US');
    // case FARSI:
    //   return Locale(FARSI, "IR");
    // case ARABIC:
    //   return Locale(ARABIC, "SA");
    case spanish:
      return  const Locale(spanish, "MX");
    case french:
      return  const Locale(french, "CA");
    case hindi:
      return const Locale(hindi, "IN");
    case kannada:
      return  const Locale(kannada, "KN");
    case malayam:
      return  const Locale(malayam, "ML");
    case portugeese:
      return  const Locale(portugeese, "PT");
    case telgu:
      return const Locale(telgu, "TE");

    default:
      return const Locale(english, 'US');
  }
}

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)?.translate(key);
}

String? translateWithoutContext(String key) {
  return DemoLocalization.instance?.translate(key);
}

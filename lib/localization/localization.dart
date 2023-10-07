import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalization {

  Map<dynamic, dynamic> _localizedValues = {};
  final Locale locale;

  DemoLocalization(this.locale);

  static DemoLocalization? of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }


  Future<void> load(languageCode) async {
    debugPrint('test language----------:${locale.languageCode}');
    String jsonStringValues = await rootBundle
        .loadString('lib/helper/lang/$languageCode.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<DemoLocalization> delegate =
  _DemoLocalizationsDelegate();

  static DemoLocalization? get instance =>
      _DemoLocalizationsDelegate.instance; // add this

}

class _DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationsDelegate();
  static DemoLocalization? instance;
  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr', 'hi','kn','ml','pt','te'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    debugPrint('test language1:${locale.languageCode}');
    DemoLocalization localization = DemoLocalization(locale);
    debugPrint('test language2:${locale.languageCode}');
    debugPrint('test language3:${localization._localizedValues}');
    debugPrint('test language4:${localization.locale.languageCode}');
    await localization.load(locale.languageCode);
    instance = localization; // set the static instance here
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalization> old) => false;
}

class Language {
  final int id;
  final String flag;
  final String name,defaultLanguage;
  final String languageCode;
  Language(this.id, this.flag, this.defaultLanguage, this.name, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "(English)","English", "en"),
      Language(2, "🇮🇳", "(Hindi)","हिंदी", "hi"),
      Language(3, "🇮🇳", "(Telugu)","తెలుగు", "te"),
      Language(4, "🇮🇳", "(Malayalam)","മലയാളം", "ml"),
      Language(5, "🇮🇳", "(Kannada)","ಕನ್ನಡ", "kn"),
      Language(6, "🇮🇪", "(Spanish)","española", "es"),
      Language(7, "🇫🇷", "(French)","française", "fr"),
      Language(8, "🇵🇹", "(Portuguese)","Português", "pt"),
    ];
  }
}
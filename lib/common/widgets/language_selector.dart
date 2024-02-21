import 'package:flutter/material.dart';

import '../../main.dart';

class LanguageOption {
  final String code;
  final String country;
  final String name;

  LanguageOption(this.code, this.country, this.name);
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  LanguageOption? _selectedLanguage;
  List<LanguageOption> _languages = [
    LanguageOption('en', 'US', 'English'),
    LanguageOption('es', 'ES', 'Español'),
    LanguageOption('zh', 'CN', '中文'),
    LanguageOption('vi', 'VN', 'Tiếng Việt'),
    LanguageOption('pt', 'PT', 'Português'),
    LanguageOption('ru', 'RU', 'Русский'),
    LanguageOption('nl', 'NL', 'Nederlands'),
    LanguageOption('de', 'DE', 'Deutsch'),
    LanguageOption('fr', 'FR', 'Français')
  ];

  // void _changeLanguage(String languageCode, String countryCode) {
  //   Locale newLocale = Locale(languageCode, countryCode);
  //   MainApp.setLocale(context, newLocale);
  // }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    String locale = currentLocale.languageCode;
    String language = "";
    switch (locale) {
      case "en":
        language = "English";
        break;
      case "es":
        language = "Español";
        break;
      case "zh":
        language = "中文";
        break;
      case "vi":
        language = "Tiếng Việt";
        break;
      case "pt":
        language = "Português";
        break;
      case "ru":
        language = "Русский";
        break;
      case "nl":
        language = "Nederlands";
        break;
      case "de":
        language = "Deutsch";
        break;
      case "fr":
        language = "Français";
        break;
      default:
        language = "Language";
    }
    return Center(
      child: DropdownButton<LanguageOption>(
        isDense: true,
        hint: Text(language),
        value: _selectedLanguage,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: Color.fromRGBO(230, 156, 36, 1)),
        underline: Container(
          height: 2,
          color: Color.fromRGBO(230, 156, 36, 1),
        ),
        onChanged: (LanguageOption? newValue) {
          // This is called when the user selects an item.
          setState(() {
            _selectedLanguage = newValue;
            //_changeLanguage(newValue!.code, newValue.country);
          });
        },
        items: _languages
            .map<DropdownMenuItem<LanguageOption>>((LanguageOption value) {
          return DropdownMenuItem<LanguageOption>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kaizen_app/first_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
  //   state?.setLocale(newLocale);
  // }
}

class _MainAppState extends State<MainApp> {
  //   Locale? _locale;

  // void setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      // ],
      //       supportedLocales: [
      //   Locale('en', 'US'), // English (United States)
      //   Locale('es', 'ES'), // Spanish (Spain)
      //   Locale('zh', 'CN'), // Chinese (China)
      //   Locale('vi', 'VN'), // Vietnamese (Vietnam)
      //   Locale('pt', 'PT'), // Portuguese (Europe)
      //   Locale('ru', 'RU'), // Russian (Russia)
      //   Locale('nl', 'NL'), // Dutch (Netherlands)
      //   Locale('de', 'DE'), // German (Germany)
      //   Locale('fr', 'FR'), // French (France)
      // ],
      // locale: _locale,
      // localeResolutionCallback:
      //     (Locale? locale, Iterable<Locale> supportedLocales) {
      //   //return locale;
      //   if (supportedLocales.contains(locale)) {
      //     return locale;
      //   }
      //   return const Locale('en', 'US');
      //   //Fallback to English if the device locale is not supported
      // },
      home: Scaffold(
        body: Center(
          child: FirstPage(),
        ),
      ),
    );
  }
}

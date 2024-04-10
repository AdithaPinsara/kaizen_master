import 'package:flutter/material.dart';
import 'package:kaizen_app/first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/auth/auth_screen.dart';
import 'screens/incident_reporting/incident_screen.dart';

void main() async {
  runApp(const MainApp());
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
  void initState() {
    // TODO: implement initState
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
                child: AuthScreen(),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   // localizationsDelegates: [
      //   //   AppLocalizations.delegate,
      //   // ],
      //   //       supportedLocales: [
      //   //   Locale('en', 'US'), // English (United States)
      //   //   Locale('es', 'ES'), // Spanish (Spain)
      //   //   Locale('zh', 'CN'), // Chinese (China)
      //   //   Locale('vi', 'VN'), // Vietnamese (Vietnam)
      //   //   Locale('pt', 'PT'), // Portuguese (Europe)
      //   //   Locale('ru', 'RU'), // Russian (Russia)
      //   //   Locale('nl', 'NL'), // Dutch (Netherlands)
      //   //   Locale('de', 'DE'), // German (Germany)
      //   //   Locale('fr', 'FR'), // French (France)
      //   // ],
      //   // locale: _locale,
      //   // localeResolutionCallback:
      //   //     (Locale? locale, Iterable<Locale> supportedLocales) {
      //   //   //return locale;
      //   //   if (supportedLocales.contains(locale)) {
      //   //     return locale;
      //   //   }
      //   //   return const Locale('en', 'US');
      //   //   //Fallback to English if the device locale is not supported
      //   // },
      //   home: Scaffold(
      //     body: Center(
      //       child: AuthScreen(),
      //     ),
      //   ),
      // ),
    );
  }
}

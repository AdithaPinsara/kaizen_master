import 'package:flutter/material.dart';
import 'package:kaizen_app/first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen_app/screens/organization_reg/organization_reg_screen.dart';
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
            home: Scaffold(
              body: Center(
                child: OrganizationRegScreen(),
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
    );
  }
}

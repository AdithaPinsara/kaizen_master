import 'package:flutter/material.dart';
import 'package:kaizen_app/services/auth/auth.dart';

import '../incident_reporting/incident_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _auth = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  //Sign in
                  dynamic result = await _auth.registerWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  if (result == null) {
                    print("Error registering in");
                  } else {
                    print("Registered in");
                    print(result.uid);
                  }
                },
                child: Text("Register"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  //Sign in
                  dynamic result = await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  if (result == null) {
                    print("Error signing in");
                  } else {
                    print("Signed in");
                    print(result.uid);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncidentScreen()),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error signing in");
                  } else {
                    print("Signed in");
                    print(result.uid);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncidentScreen()),
                    );
                  }
                },
                child: Text("Anonymous Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

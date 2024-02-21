import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityIcon extends StatefulWidget {
  const ConnectivityIcon({super.key});

  @override
  _ConnectivityIconState createState() => _ConnectivityIconState();
}

class _ConnectivityIconState extends State<ConnectivityIcon> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();

    // Subscribe to the connectivity change
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isConnected = result != ConnectivityResult.none;
      });
    });

    checkInternetConnection();

    //Set up a timer to check the connection every 3 seconds
    // Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   checkInternetConnection();
    // });
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    subscription.cancel();
    super.dispose();
  }

  // Function to check the internet connection status
  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.75,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.wifi,
                size: 15,
                color: Colors.white,
              ),
            ),
          )
        : Column(
            children: [
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 0.75,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.wifi_off,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Offline",
                //AppLocalizations.of(context)!.offline,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          );
  }
}

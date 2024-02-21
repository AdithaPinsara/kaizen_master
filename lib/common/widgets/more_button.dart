import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  MoreButton({super.key});
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // void logout() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   //await SessionManager().destroy();
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.remove('date');
  //   await prefs.remove('siteId');
  //   await prefs.remove('selectedSiteId');
  //   await prefs.remove('hrmdate');
  //   await prefs.setBool("logged", false);
  //   siteController.siteIds.forEach((element) {
  //     prefs.remove('${element}_accompaniedBies');
  //     prefs.remove('${element}_date');
  //     // prefs.remove('${element}_hrMessageId');
  //   });
  //   authController.logout();
  //   if (!(connectivityResult != ConnectivityResult.none && authController.accessToken != null)) {
  //     Get.toNamed("/");
  //   }
  //   //_OpenItemListState().observations = null;
  // }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      offset: Offset(0, 40),
      icon: Icon(Icons.more_vert),
      onSelected: (String value) async {
        //final SharedPreferences prefs = await _prefs;
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: Text(
              "logout",
              //AppLocalizations.of(context)!.logout,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                //color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              "logout",
              //AppLocalizations.of(context)!.logoutContent,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                //color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: <Widget>[
              SizedBox(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize:
                          Localizations.localeOf(context) == Locale('de', 'DE')
                              ? 11
                              : 14,
                      fontWeight: FontWeight.w700,
                    ),
                    foregroundColor: Colors.orangeAccent,
                    side:
                        const BorderSide(color: Colors.orangeAccent, width: 1),
                  ),
                  onPressed: () {},
                  child: Text(
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontFamily: "Inter",
                      fontSize: Localizations.localeOf(context) ==
                                  Locale('de', 'DE') ||
                              Localizations.localeOf(context) ==
                                  Locale('nl', 'NL') ||
                              Localizations.localeOf(context) ==
                                  Locale('es', 'ES') ||
                              Localizations.localeOf(context) ==
                                  Locale('vi', 'VN') ||
                              Localizations.localeOf(context) ==
                                  Locale('ru', 'RU') ||
                              Localizations.localeOf(context) ==
                                  Locale('nl', 'NL')
                          ? 11
                          : 12,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    "cancle",
                    //AppLocalizations.of(context)!.cancel
                  ),
                ),
              ),
              SizedBox(
                width: 95,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  ),
                  onPressed: () {},
                  child: Text(
                    "yes",
                    //AppLocalizations.of(context)!.yes,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: Localizations.localeOf(context) ==
                                  Locale('de', 'DE') ||
                              Localizations.localeOf(context) ==
                                  Locale('nl', 'NL') ||
                              Localizations.localeOf(context) ==
                                  Locale('es', 'ES') ||
                              Localizations.localeOf(context) ==
                                  Locale('vi', 'VN') ||
                              Localizations.localeOf(context) ==
                                  Locale('ru', 'RU') ||
                              Localizations.localeOf(context) ==
                                  Locale('nl', 'NL')
                          ? 11
                          : 12,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemBuilder: (BuildContext context) => [
        // PopupMenuItem<String>(
        //   value: 'notification',
        //   child: Text(AppLocalizations.of(context)!.notifications),
        // ),
        PopupMenuItem<String>(
            value: 'logout',
            child: Text("logout"
                //AppLocalizations.of(context)!.logout
                )),

        PopupMenuItem(
          child: Text(
            "Reset Pin",
          ),
          value: 'reset_pin',
        )
      ],
    );
  }
}

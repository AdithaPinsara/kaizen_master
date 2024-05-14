import 'package:flutter/material.dart';

import '../../common/widgets/connectivity_icon.dart';
import '../../common/widgets/date_picker.dart';
import '../../common/widgets/dropdown_field.dart';
import '../../common/widgets/evidence_selector.dart';
import '../../common/widgets/more_button.dart';
import '../../common/widgets/radio_buttons.dart';
import '../../common/widgets/text_form_field.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () async {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                                color: (Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: MediaQuery.of(context).size.width > 720 ? 12 : 6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: Text(
                              "Incident Reporting",
                              //AppLocalizations.of(context)!.syncItems,
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                fontSize: Localizations.localeOf(context) ==
                                        Locale('es', 'ES')
                                    ? 26
                                    : 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: MediaQuery.of(context).size.width > 720 ? 12 : 6,
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.only(top: 50),
                    //       child: Text(
                    //         //"Sync items",
                    //         AppLocalizations.of(context)!.syncItems,

                    //         style: TextStyle(
                    //           fontFamily: 'Playfair Display',
                    //           fontSize: Localizations.localeOf(context) ==
                    //                   Locale('es', 'ES')
                    //               ? 26
                    //               : 32,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //         overflow: Localizations.localeOf(context) ==
                    //                 Locale('es', 'ES')
                    //             ? null
                    //             : TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: ConnectivityIcon()),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: MoreButton(),
                      ),
                    ),
                  ],
                ),
                Container(
                  //constraints: BoxConstraints(maxWidth: 720),
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
                      //   child: Text(
                      //     '${AppLocalizations.of(context)!.noOfRecords}: ',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      //     child: Text(
                      //       recordCount.toString(),
                      //       style:
                      //           TextStyle(fontSize: 18, color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Column(
                        children: [
                          //EvidenceSelector(),
                          CommonTextField(
                            name: "Title",
                          ),
                          CommonTextField(
                            name: "Description",
                          ),
                          DropDownField(
                            name: "Category",
                            items: [],
                          ),
                          DropDownField(
                            name: "Sub Category",
                            items: [],
                          ),
                          RadioButtons(
                            name: "Anonymous Suggestion",
                          ),
                          CommonTextField(
                            name: "Additional Information",
                          ),
                        ],
                      ),
                    ),
                    // PagedListView<int, ObservationDto>(
                    //   padding: EdgeInsets.symmetric(vertical: 20),
                    //   pagingController: _pagingController,
                    //   builderDelegate: PagedChildBuilderDelegate<ObservationDto>(
                    //     itemBuilder: (context, item, index) {
                    //       priority = item.priority?.id;
                    //       description = item.descriptionOfObservation.toString();
                    //       return Container(
                    //         color: Colors.transparent,
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(bottom: 16),
                    //           child: Card(
                    //             borderOnForeground: true,
                    //             color: priority == EnumPriority.High.id
                    //                 ? Colors.orange[50]
                    //                 : priority == EnumPriority.Medium.id
                    //                     ? Colors.blue[50]
                    //                     : priority == EnumPriority.Low.id
                    //                         ? Colors.grey[100]
                    //                         : Colors.white,
                    //             margin: EdgeInsets.only(left: 8, right: 8),
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10),

                    //               // You can adjust the radius as needed
                    //             ),
                    //             elevation: 0,
                    //             child: ClipPath(
                    //               clipper: ShapeBorderClipper(
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius: BorderRadius.circular(10))),
                    //               child: Container(
                    //                 // padding: EdgeInsets.all(16),
                    //                 decoration: BoxDecoration(
                    //                   border: Border(
                    //                     left: BorderSide(
                    //                       width: 8,
                    //                       color: priority == EnumPriority.High.id
                    //                           ? Colors.orange[300]!
                    //                           : priority == EnumPriority.Medium.id
                    //                               ? Colors.blue[500]!
                    //                               : priority == EnumPriority.Low.id
                    //                                   ? Colors.grey[500]!
                    //                                   : Colors.white,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 transform: Matrix4.translationValues(0, 0, 0),
                    //                 child: _cardData(item, index, item.id!),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },

                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      // blue square indicater
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          'assets/images/sync_item/sync.gif',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Syncing",
                        //AppLocalizations.of(context)!.syncing,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.cloud_off_rounded,
                        color: Colors.red[500],
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Sync Failed",
                        //AppLocalizations.of(context)!.syncingFailed,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'connectivity_icon.dart';
import 'more_button.dart';

class PageSample1 extends StatefulWidget {
  const PageSample1({super.key});

  @override
  State<PageSample1> createState() => _PageSample1State();
}

class _PageSample1State extends State<PageSample1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        color: Colors.indigo[900],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: MediaQuery.of(context).size.width > 720 ? 12 : 6,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Text(
                        "Title",
                        //AppLocalizations.of(context)!.location,
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: ConnectivityIcon()),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: MoreButton(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 15, 9, 12),
              child: Container(
                height: 60,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  //controller: _searchController,
                  onFieldSubmitted: (value) async {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 13, bottom: 13),
                    fillColor: Colors.white, // set the fill color
                    filled: true, // set filled to true
                    hintText: "search",
                    //AppLocalizations.of(context)!.search,
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(50), // set the border radius
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: true,
                          child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(width: 1, color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      constraints: BoxConstraints(minHeight: 700),
                    ),
                  ),
                ),
              ),
            )
            //imported the NewList widget from new_card file into widget tree
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDatePicker extends StatefulWidget {
  const CommonDatePicker({super.key});

  @override
  State<CommonDatePicker> createState() => _CommonDatePickerState();
}

class _CommonDatePickerState extends State<CommonDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  children: [
                    Text(
                      "Common Date Picker",
                      //AppLocalizations.of(context)!.dueDate,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextFormField(
            readOnly: true,
            //focusNode: dueDateFocusNode,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actionsPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      title: Text("Due Date"),
                      content: Container(
                        constraints: BoxConstraints(
                          maxHeight: 250,
                          minWidth: 300,
                          maxWidth: 550,
                        ),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          //initialDateTime: selectedDate,
                          // minimumDate:
                          //     selectedDate.isBefore(DateTime.now())
                          //         ? selectedDate
                          //         : DateTime(
                          //             DateTime.now().year,
                          //             DateTime.now().month,
                          //             DateTime.now().day,
                          //             0,
                          //             0,
                          //             0),
                          // DateTime(
                          //   DateTime.now().day,
                          //   DateTime.now().month,
                          //   DateTime.now().year,
                          // ),
                          dateOrder: DatePickerDateOrder.dmy,
                          onDateTimeChanged: (DateTime newDateTime) {
                            //selectedDate = newDateTime;
                          },
                        ),
                      ),
                      actions: <Widget>[
                        SizedBox(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.orangeAccent,
                              side: const BorderSide(
                                  color: Colors.orangeAccent, width: 1),
                            ),
                            child: Text(
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                "Cancel"
                                //AppLocalizations.of(context)!.cancel
                                ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 95,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orangeAccent),
                            ),
                            child: Text(
                              "Ok",
                              //AppLocalizations.of(context)!.ok,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    );
                  });
            },
            //controller: _dateController,
            //enabled: widget.isEditable && enableCreate,
            decoration: InputDecoration(
              // suffix: Visibility(
              //   visible: this._observationFormData.dueDateChangeReasonList !=
              //           null &&
              //       this._observationFormData.dueDateChangeReasonList!.length >
              //           0,
              //   child: Container(
              //     alignment: Alignment.center,
              //     width: 20,
              //     height: 20,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.orange,
              //     ),
              //     child: Text(
              //       this
              //               ._observationFormData
              //               .dueDateChangeReasonList
              //               ?.length
              //               .toString() ??
              //           '0',
              //       style: TextStyle(
              //         fontSize: 13,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              hintText: "Select",
              prefixIcon: Icon(Icons.calendar_today),
              filled: true,
              fillColor: const Color(0xffffffff),
              //labelText: widget.isEditable ? 'dd/mm/yyyy' : null,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            validator: (data) {
              // if (data!.isEmpty) {
              //   return 'Required';
              // }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

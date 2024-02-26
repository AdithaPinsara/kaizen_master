import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Radio",
            //AppLocalizations.of(context)!.repeatedObservation,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Radio(
                value: true,
                visualDensity: VisualDensity.compact,
                groupValue: false,
                onChanged: (value) {},
              ),
              Text(
                "Yes",
                //AppLocalizations.of(context)!.yes,
                // style: TextStyle(
                //     color: widget.isEditable && enableCreate
                //         ? Colors.black
                //         : Colors.grey),
              ),
              Radio(
                value: false,
                groupValue: false,
                onChanged: (value) {},
              ),
              Text(
                "No",
                //AppLocalizations.of(context)!.no,
                // style: TextStyle(
                //     color: widget.isEditable && enableCreate
                //         ? Colors.black
                //         : Colors.grey),
              ),
            ],
          ),
          Text(
            //AppLocalizations.of(context)!.repeatedObservationText,
            "Note: Choose 'Yes' if the observation is a repeated more than once",
            style: TextStyle(
              fontSize: 11,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

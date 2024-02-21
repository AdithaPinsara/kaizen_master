import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  final List<DropdownMenuItem<int>>? items;
  final String? name;

  DropDownField({Key? key, required this.items, this.name}) : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
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
                      widget.name ?? "",
                      //AppLocalizations.of(context)!.area,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                isDense: true,
                //focusNode: functionAreaFocusNode,
                //key: _functionAreaFieldKey,
                hint: Text("Select"),
                //Text(AppLocalizations.of(context)!.select),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  //labelText: AppLocalizations.of(context)!.select,
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                value: 0,
                onChanged: (int? value) {},
                items: widget.items,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String? name;
  const CommonTextField({Key? key, this.name}) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                      //AppLocalizations.of(context)!.description,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 75,
            child: TextFormField(
              //key: _descriptionFieldKey,
              //controller: _observationFormData.description,
              maxLength: 500,
              buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) {
                //text = currentLength;
                return Text("$currentLength/$maxLength",
                    style: TextStyle(
                        fontSize: 14,
                        color: isFocused ? Colors.black : Colors.grey));
              },
              //enabled: widget.isEditable,
              onChanged: (value) {},
              //focusNode: descriptionFocusNode,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
                filled: true,
                fillColor: const Color(0xffffffff),
                //hintText: AppLocalizations.of(context)!.typeHere,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
                //labelText: AppLocalizations.of(context)!.description,
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 15, 15, 15),
                // (text > 100)
                //     ? EdgeInsets.fromLTRB(10, 25, 0, 20)
                //     : (text > 50)
                //         ? EdgeInsets.fromLTRB(10, 25, 0, 40)
                //         : EdgeInsets.fromLTRB(10, 25, 0, 60),
                //isDense: true,
                alignLabelWithHint: true,
              ),
              //maxLines: null,
              //expands: true,
              // validator: (data) {
              //   if (data!.isEmpty) {
              //     return AppLocalizations.of(context)!.requiredDes;
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}

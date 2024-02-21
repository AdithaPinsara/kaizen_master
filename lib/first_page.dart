import 'package:flutter/material.dart';

import 'common/widgets/dropdown_field.dart';
import 'common/widgets/evidence_selector.dart';
import 'common/widgets/language_selector.dart';
import 'common/widgets/text_form_field.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: DropDownField(
                  name: "dropdwon",
                  items: [],
                )),
            CommonTextField(
              name: "text",
            ),
            EvidenceSelector(),
            LanguageSelector(),
          ]),
        ));
  }
}

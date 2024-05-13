import 'package:flutter/material.dart';
import 'package:kaizen_app/common/widgets/text_form_field.dart';

class OrganizationRegScreen extends StatefulWidget {
  const OrganizationRegScreen({super.key});

  @override
  State<OrganizationRegScreen> createState() => _OrganizationRegScreenState();
}

class _OrganizationRegScreenState extends State<OrganizationRegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CommonTextField(
              name: "Name of the organization",
            ),
            CommonTextField(
              name: "Departments",
            ),
          ],
        ),
      ),
    );
  }
}

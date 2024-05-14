import 'package:flutter/material.dart';
import 'package:kaizen_app/common/widgets/multi_value_textfield.dart';
import 'package:kaizen_app/common/widgets/text_form_field.dart';

class OrganizationRegScreen extends StatefulWidget {
  const OrganizationRegScreen({super.key});

  @override
  State<OrganizationRegScreen> createState() => _OrganizationRegScreenState();
}

class _OrganizationRegScreenState extends State<OrganizationRegScreen> {
  final _controller = TextEditingController();
  final departmentController = TextEditingController();
  final List<String>? departmentList = [];

  void addDepartment() {
    setState(() {
      departmentList?.add(departmentController.text);
    });
  }

  void removeDepartment(int index) {
    setState(() {
      departmentList?.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CommonTextField(
                name: "Name of the organization",
                controller: _controller,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return MultiValueTextField(
                          controller: departmentController,
                          hintText: "Department",
                          title: "Add a new department",
                          values: departmentList,
                          onPressed: addDepartment,
                          onRemove: removeDepartment,
                        );
                      });
                },
                child: Text("Departments"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

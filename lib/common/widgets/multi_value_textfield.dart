import 'package:flutter/material.dart';

class MultiValueTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onPressed;
  final List<String>? values;
  const MultiValueTextField(
      {super.key, required this.controller, this.onPressed, this.values});

  @override
  State<MultiValueTextField> createState() => _MultiValueTextFieldState();
}

class _MultiValueTextFieldState extends State<MultiValueTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: widget.controller,
              ),
              IconButton(
                onPressed: widget.onPressed,
                icon: Icon(Icons.add),
              )
            ],
          ),
          ListView()
        ],
      ),
    );
  }
}

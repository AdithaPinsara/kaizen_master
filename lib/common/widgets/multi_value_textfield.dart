import 'package:flutter/material.dart';

class MultiValueTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onPressed;
  final Function(int)? onRemove;
  final List<String>? values;
  final String? title;
  final String? hintText;
  const MultiValueTextField(
      {super.key,
      required this.controller,
      this.onPressed,
      this.values,
      this.title,
      this.hintText,
      this.onRemove});

  @override
  State<MultiValueTextField> createState() => _MultiValueTextFieldState();
}

class _MultiValueTextFieldState extends State<MultiValueTextField> {
  List<String> departmentList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
          titlePadding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
          actionsAlignment: MainAxisAlignment.spaceAround,
          backgroundColor: Colors.grey[300],
          surfaceTintColor: Colors.white,
          scrollable: true,
          title: Column(
            children: [Text(widget.title ?? ""), Divider()],
          ),
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: TextField(
                        controller: widget.controller,
                        decoration: InputDecoration(
                          hintText: widget.hintText ?? "",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          departmentList.add(widget.controller.text);
                        });
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .blue, // You can change the color to your preference
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Adjust the padding as needed
                          child: Icon(Icons.add,
                              color: Colors
                                  .white), // You can adjust the icon color
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Scrollbar(
                  thickness: 5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    scrollDirection: Axis.vertical,
                    itemCount: departmentList.length,
                    itemBuilder: (context, int index) {
                      return SizedBox(
                        //height: 25,
                        //width: 120,
                        child: Card(
                          child: Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      //changehere
                                      departmentList[index],

                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      departmentList.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("close"),
            ),
          ],
        ),
      ),
    );
  }
}

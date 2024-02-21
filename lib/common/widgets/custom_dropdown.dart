import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpenItemDropdown extends StatefulWidget {
  int filterType;
  int count;
  Function(String) onChange;
  String dropDownText;
  //List<PopupMenuItem<String>> items;

  OpenItemDropdown(
      {super.key,
      required this.filterType,
      required this.count,
      required this.onChange,
      required this.dropDownText});

  @override
  State<OpenItemDropdown> createState() => _OpenItemDropdownState();
}

class _OpenItemDropdownState extends State<OpenItemDropdown> {
  final List<String> menuItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  void initState() {
    //loadInitialData();
    super.initState();
  }

  // void loadInitialData() async {
  //   //var location = await authController.getDeviceLocation();
  //   var observationDto = new ObservationDto(
  //     functionAreaId: 0,
  //     buildingId: 0,
  //     siteId: ctrl.siteId,
  //     categoryId: 0,
  //     priorityId: 0,
  //     observationStatusId: 0,
  //     statusId: 0,
  //     id: 0,
  //     modifiedDate: DateTime.now(),
  //     modifiedBy: 0,
  //     deviceLocation: null,
  //   );
  //   var actionResponse =
  //       await ObservationService().getObservationInitData(observationDto);

  //   if (actionResponse.isSuccess == true && actionResponse.data != null) {
  //     var response = ObservationDto.fromJson(actionResponse.data as dynamic);
  //     dropdownData = response;
  //   } else {
  //     dropdownData = observationDto;
  //   }
  // }

  void onChanged(String value) {
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    bool hasSelection = widget.dropDownText != "select";
    //AppLocalizations.of(context)!.select;

    return GestureDetector(
      onTap: () {
        _showPopupMenu(context);
      },
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  widget.dropDownText == "" ? "select" : widget.dropDownText,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: hasSelection,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.clear,
                    color: Colors.blue[500],
                  ),
                  onPressed: () {
                    // Clear the selection logic here
                    onChanged("0");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 30,
                color: Colors.blue[500],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 20,
                  width: 20,
                  child: Badge.count(
                    count: widget.count,
                    backgroundColor: Colors.blue[600],
                    textStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox container = context.findRenderObject() as RenderBox;

    List<PopupMenuEntry<String>> menuItems = [];
    // if (widget.filterType == EnumOpenItemFilterType.AREA.id) {
    //   menuItems = dropdownData!.functionalAreaList!
    //       .map((item) => PopupMenuItem<String>(
    //             child: Text(item.label?.toString() ?? ''),
    //             value: item.value.toString(),
    //           ))
    //       .toList();
    // } else if (widget.filterType == EnumOpenItemFilterType.BUILDING.id) {
    //   menuItems = dropdownData!.buildingList!
    //       .map((item) => PopupMenuItem<String>(
    //             child: Text(item.label?.toString() ?? ''),
    //             value: item.value.toString(),
    //           ))
    //       .toList();
    // } else if (widget.filterType == EnumOpenItemFilterType.CATEGORY.id) {
    //   menuItems = dropdownData!.categoryList!
    //       .map((item) => PopupMenuItem<String>(
    //             child: Text(item.label?.toString() ?? ''),
    //             value: item.value.toString(),
    //           ))
    //       .toList();
    // } else {
    //   menuItems = (widget.filterType == EnumOpenItemFilterType.AREA.id
    //       ? dropdownData!.functionalAreaList!
    //           .map((item) => PopupMenuItem<String>(
    //                 child: Text(item.label?.toString() ?? ''),
    //                 value: item.value.toString(),
    //               ))
    //           .toList()
    //       : widget.filterType == EnumOpenItemFilterType.BUILDING.id
    //           ? dropdownData!.buildingList!
    //               .map((item) => PopupMenuItem<String>(
    //                     child: Text(item.label?.toString() ?? ''),
    //                     value: item.value.toString(),
    //                   ))
    //               .toList()
    //           : widget.filterType == EnumOpenItemFilterType.CATEGORY.id
    //               ? dropdownData!.categoryList!
    //                   .map((item) => PopupMenuItem<String>(
    //                         child: Text(item.label?.toString() ?? ''),
    //                         value: item.value.toString(),
    //                       ))
    //                   .toList()
    //               : <PopupMenuEntry<
    //                   String>>[]); // Add an empty list as the default value
    // }

    final overlayRect = Rect.fromPoints(
      overlay.localToGlobal(Offset.zero, ancestor: overlay),
      overlay.localToGlobal(overlay.size.bottomRight(Offset.zero),
          ancestor: overlay),
    );

    final containerRect = Rect.fromPoints(
      container.localToGlobal(Offset.zero, ancestor: overlay),
      container.localToGlobal(container.size.bottomLeft(Offset.zero),
          ancestor: overlay),
    );

    final position = RelativeRect.fromRect(
      containerRect.translate(
          0.0, containerRect.height), // Adjust the vertical offset as needed
      overlayRect,
    );

    final selectedValue = await showMenu<String>(
      context: context,
      position: position,
      items: menuItems,
    );

    if (selectedValue != null) {
      onChanged(selectedValue);
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   bool hasSelection =
  //       widget.dropDownText != AppLocalizations.of(context)!.select;
  //   return Container(
  //     height: 28,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Expanded(
  //           flex: 5,
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
  //             child: Text(
  //               widget.dropDownText == ""
  //                   ? AppLocalizations.of(context)!.select
  //                   : widget.dropDownText,
  //               style: TextStyle(fontSize: 16),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: Visibility(
  //             visible: hasSelection,
  //             child: IconButton(
  //               padding: EdgeInsets.zero,
  //               icon: Icon(
  //                 Icons.clear,
  //                 color: Colors.blue[500],
  //               ),
  //               onPressed: () {
  //                 // Clear the selection logic here
  //                 onChanged("0");
  //               },
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: PopupMenuButton<String>(
  //             offset: Offset(25, 30),
  //             padding: EdgeInsets.zero,
  //             icon: Icon(
  //               Icons.keyboard_arrow_down,
  //               size: 30,
  //               color: Colors.blue[500],
  //             ),
  //             itemBuilder: (BuildContext context) {
  //               return widget.filterType == EnumOpenItemFilterType.AREA.id
  //                   ? dropdownData!.functionalAreaList!
  //                       .map((item) => PopupMenuItem<String>(
  //                             child: Text(item.label?.toString() ?? ''),
  //                             value: item.value.toString(),
  //                           ))
  //                       .toList()
  //                   : widget.filterType == EnumOpenItemFilterType.BUILDING.id
  //                       ? dropdownData!.buildingList!
  //                           .map((item) => PopupMenuItem<String>(
  //                                 child: Text(item.label?.toString() ?? ''),
  //                                 value: item.value.toString(),
  //                               ))
  //                           .toList()
  //                       : widget.filterType ==
  //                               EnumOpenItemFilterType.CATEGORY.id
  //                           ? dropdownData!.categoryList!
  //                               .map((item) => PopupMenuItem<String>(
  //                                     child: Text(item.label?.toString() ?? ''),
  //                                     value: item.value.toString(),
  //                                   ))
  //                               .toList()
  //                           : menuItems.map((String item) {
  //                               return PopupMenuItem<String>(
  //                                 value: item,
  //                                 child: Text(item),
  //                               );
  //                             }).toList();
  //             },
  //             onSelected: onChanged,
  //           ),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: Container(
  //               height: 20,
  //               width: 20,
  //               child: Badge.count(
  //                 count: widget.count,
  //                 backgroundColor: Colors.blue[600],
  //                 textStyle: TextStyle(fontSize: 14),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

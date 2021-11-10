// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class Data {
  String title;
  bool value;

  Data(this.title, this.value);

  @override
  String toString() {
    return 'Data{title: $title, value: $value}';
  }
}

List<Data> selectedItems = [];

bool value = false;

Map<String, bool> list = {
  '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria':
      false,
  '19, Martins Crescent, Bank of Nigeria, Abuja, Nigeria': false,
};

List<String> address = [
  '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria',
  '19, Martins Crescent, Bank of Nigeria, Abuja, Nigeria'
];

var array = [];
getCheckboxItems() {
  list.forEach((key, value) {
    if (value == true) {
      array.add(key);
    }
  });
  // Printing all selected items on Terminal screen.
  print(array);
  // Clear array after use.
  array.clear();
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  buildChips() {
    List<Widget> chips = [];
    for (int i = 0; i < list.length; i++) {
      InputChip actionChip = InputChip(
        selected: list[i]!,
        label: Text(selectedItems.toString()),
        pressElevation: 5,
        onPressed: () {
          setState(() {
            selectedItems = selectedItems;
          });
        },
        onDeleted: () {
          list.clear();
          selectedItems.removeAt(i);
          setState(() {
            selectedItems = selectedItems;
          });
        },
      );
      chips.add(actionChip);
    }
  }
}

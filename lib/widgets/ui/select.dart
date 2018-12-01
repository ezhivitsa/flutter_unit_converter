import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SelectItem {
  final String label;
  final String value;

  SelectItem({
    @required this.label,
    @required this.value,
  });
}

class Select extends StatelessWidget {
  final List<SelectItem> items;

  Select({
    @required this.items,
  });

  List<DropdownMenuItem<String>> dropdownItems() {
    return items.map((item) {
      return DropdownMenuItem(
        value: item.value,
        child: Text(item.label),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.white70,
          ),
          child: DropdownButton(
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 30.0,
            ),
            items: dropdownItems(),
            isExpanded: true,
            onChanged: (value) {
              print(value);
            },
            value: items[0].value,
          ),
        ),
      ),
    );
  }
}
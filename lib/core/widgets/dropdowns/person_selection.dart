import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../models/customer_model.dart';

primaryDropDown(
  String title,
  List<CustomerModel> options,
  ValueChanged<CustomerModel?> onChanged,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Replace with your border color
          width: 1, // Replace with your desired border width
        ),
        borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownSearch<CustomerModel>(
            itemAsString: (CustomerModel u) => u.name,
            popupProps: const PopupProps.menu(
              showSearchBox: true,
              constraints:
                  BoxConstraints(maxHeight: 150), // Set max height here
            ),
            items: options,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: title,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/coin_data.dart';

class CustomPicker {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem> createList() {
      return currenciesList
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList();
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: createList(),
      onChanged: (value) {
        selectedCurrency = value;
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> createPickerList() {
      return currenciesList.map((e) => Text(e)).toList();
    }

    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          selectedCurrency = currenciesList[selectedIndex];
        },
        children: createPickerList());
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    }
    return androidDropdown();
  }
}

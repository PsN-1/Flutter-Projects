import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:math';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String currentBTCPrice;
  String currentETHPrice;
  String currentLTCPrice;

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: createList(),
      onChanged: (value) {
        selectedCurrency = value;
        getCoinsData(selectedCurrency);
      },
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          selectedCurrency = currenciesList[selectedIndex];
          getCoinsData(selectedCurrency);
        },
        children: createPickerList());
  }

  List<DropdownMenuItem> createList() {
    return currenciesList
        .map((e) => DropdownMenuItem(child: Text(e), value: e))
        .toList();
  }

  List<Text> createPickerList() {
    return currenciesList.map((e) => Text(e)).toList();
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    }
    return androidDropdown();
  }

  void getCoinData(String currency) async {
    CoinData coinData = CoinData();

    var value = await coinData.getCoinData(currency, 'USD');
    print(value['rate'].toString());
    setState(() {
      currentBTCPrice = value['rate'].toStringAsFixed(2);
    });

    print(currentBTCPrice);
  }

  void getCoinsData(String currency) async {
    CoinData coinData = CoinData();

    var values = await coinData.getCoinsData(currency);

    setState(() {
      currentBTCPrice = values[0]['rate'].toStringAsFixed(0);
      currentETHPrice = values[1]['rate'].toStringAsFixed(0);
      currentLTCPrice = values[2]['rate'].toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();

    getCoinData('USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $currentBTCPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $currentETHPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $currentLTCPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getPicker()),
        ],
      ),
    );
  }
}

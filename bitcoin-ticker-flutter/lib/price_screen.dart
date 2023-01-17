import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/custom_picker.dart';
import 'package:bitcoin_ticker/price_text_field.dart';
import 'package:flutter/material.dart';
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

  CustomPicker customPicker = CustomPicker();

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

    getCoinsData('USD');
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
          PriceTextField(text: '1 BTC = $currentBTCPrice $selectedCurrency'),
          PriceTextField(text: '1 ETH = $currentETHPrice $selectedCurrency'),
          PriceTextField(text: '1 LTC = $currentLTCPrice $selectedCurrency'),
          Spacer(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: customPicker.getPicker(),
          ),
          Container(
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCurrency = customPicker.selectedCurrency;
                });
                getCoinsData(selectedCurrency);
              },
              child: Text(
                'Get Price',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

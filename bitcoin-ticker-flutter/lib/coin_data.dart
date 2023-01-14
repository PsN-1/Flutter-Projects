import 'package:bitcoin_ticker/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const url = 'rest.coinapi.io';
const endpoint = '/v1/exchangerate';
const apiKey = 'EE8AD297-3FF3-4DEA-A56F-A65E7CEBDC4F';

class CoinData {
  Future<dynamic> getCoinData(String currency, String coin) async {
    var uri = Uri.http(url, '$endpoint/$coin/$currency');
    var headers = {
      'X-CoinAPI-Key': apiKey,
    };
    NetworkHelper networkHelper = NetworkHelper(url: uri, headers: headers);

    var coinData = await networkHelper.getData();
    return coinData;
  }

  Future<dynamic> getCoinsData(String currency) async {
    var data = [];
    for (var crypto in cryptoList) {
      data.add(await getCoinData(currency, crypto));
    }

    return data;
  }
}

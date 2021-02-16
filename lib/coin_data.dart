import 'package:http/http.dart' as http;

import './currency_parser.dart';

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
  'NIS',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String kApiKey = "226966E3-6BEB-4746-B6A1-58F9E7B8DBF0";
const String kUrl = "https://rest.coinapi.io/v1/exchangerate/";

class CoinData {
  static Future<Map<String, String>> getData({String to}) async {
    Map<String, String> map = Map();
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get("$kUrl$crypto/$to?apiKey=$kApiKey");
      if (response.statusCode == 200) {
        Parser parser = parserFromJson(response.body);
        map[crypto] = parser.rate.toStringAsFixed(2);
      }
    }
    return map;
  }
}

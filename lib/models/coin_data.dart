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
  'ZAR',
];

class Crypto {
  final String symbol;
  final String id;
  final String name;

  const Crypto({required this.symbol, required this.id, required this.name});
}

const cryptos = [
  Crypto(symbol: 'BTC', id: 'bitcoin', name: 'Bitcoin'),
  Crypto(symbol: 'ETH', id: 'ethereum', name: 'Ethereum'),
  Crypto(symbol: 'LTC', id: 'litecoin', name: 'Litecoin'),
];

class CoinData {}

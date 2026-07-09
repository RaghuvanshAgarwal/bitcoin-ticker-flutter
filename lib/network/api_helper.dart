import 'package:bitcoin_ticker/utility/secrets.dart';

abstract final class ApiHelper {
  static Uri getCryptoPriceAgainstCurrencyAPI({
    required String crypto,
    required String currency,
  }) {
    return getCryptoPriceAgainstCurrencyListAPI(
      crypto: [crypto],
      currency: currency,
    );
  }

  static Uri getCryptoPriceAgainstCurrencyListAPI({
    required List<String> crypto,
    required String currency,
  }) {
    return Uri(
      scheme: 'https',
      host: 'api.coingecko.com',
      path: 'api/v3/simple/price',
      queryParameters: {'vs_currencies': currency, 'ids': crypto.join(',')},
    );
  }

  static Map<String, String> get headers => {
    'x-cg-demo-api-key': Secrets.kCoinGeckoAPIKey,
    'accept': 'application/json',
  };
}

import 'package:bitcoin_ticker/models/coin_data.dart';
import 'package:bitcoin_ticker/models/price_response.dart';
import 'package:bitcoin_ticker/network/api_helper.dart';
import 'package:bitcoin_ticker/network/networking.dart';
import 'package:bitcoin_ticker/screens/price_screen.dart';
import 'package:flutter/cupertino.dart';

class PriceScreenController extends ChangeNotifier {
  String selectedCurrency = '';
  PriceScreen priceScreen;
  Map<String, double> priceList = {};

  PriceScreenController({required this.priceScreen}) {}

  Future<PriceResponse> getData() async {
    List<String> cryptoIds = [];
    for (final Crypto crypto in cryptos) {
      cryptoIds.add(crypto.id);
    }
    print(cryptoIds);

    NetworkHelper<PriceResponse> helper = NetworkHelper(
      uri: ApiHelper.getCryptoPriceAgainstCurrencyListAPI(
        crypto: cryptoIds,
        currency: selectedCurrency,
      ),
      header: ApiHelper.headers,
      fromJson: (json) {
        return PriceResponse.fromJson(json);
      },
    );
    PriceResponse result = await helper.get();
    return result;
  }

  Future<void> onCurrencySelection(String newCurrency) async {
    selectedCurrency = newCurrency;
    priceList.clear();
    notifyListeners();
    PriceResponse response = await getData();
    updatePriceList(response);
  }

  void updatePriceList(PriceResponse response) {
    priceList['bitcoin'] = response.bitcoin.currencyValue(selectedCurrency);
    priceList['ethereum'] = response.ethereum.currencyValue(selectedCurrency);
    priceList['litecoin'] = response.litecoin.currencyValue(selectedCurrency);
    print(priceList);
    notifyListeners();
  }

  bool hasPriceOfCrypto(String crypto) {
    return priceList.containsKey(crypto);
  }

  double getPriceOfCrypto(String crypto) {
    if (!hasPriceOfCrypto(crypto)) return 0.0;
    return priceList[crypto]!;
  }
}

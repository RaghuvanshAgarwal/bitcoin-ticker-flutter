import 'dart:io' show Platform;
import 'package:bitcoin_ticker/controllers/price_screen_controller.dart';
import 'package:bitcoin_ticker/models/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late final PriceScreenController controller = PriceScreenController(
    priceScreen: widget,
  );

  DropdownButton<String> getDropdownButton(
    Function(String?) onCurrencyNameSelected,
  ) {
    return DropdownButton<String>(
      value: controller.selectedCurrency,
      items: currenciesList.map((currency) {
        return DropdownMenuItem<String>(
          child: Text(
            currency,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          value: currency,
        );
      }).toList(),
      onChanged: (value) => {onCurrencyNameSelected(value)},
    );
  }

  CupertinoPicker getPicker(Function(int) onCurrencyIndexSelected) {
    return CupertinoPicker(
      itemExtent: 32,
      changeReportingBehavior: ChangeReportingBehavior.onScrollEnd,
      onSelectedItemChanged: (selectedIndex) {
        onCurrencyIndexSelected(selectedIndex);
      },
      children: currenciesList.map((toElement) {
        return Text(
          toElement,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        );
      }).toList(),
    );
  }

  Widget? getCurrencySelector() {
    if (Platform.isAndroid) {
      return getDropdownButton(onCurrencyNameSelected);
    } else if (Platform.isIOS) {
      return getPicker(onCurrencyIndexSelected);
    }
    return Text('Platform not Supported');
  }

  void onCurrencyIndexSelected(int currencyIndex) {
    onCurrencyNameSelected(currenciesList[currencyIndex]);
  }

  void onCurrencyNameSelected(String? newCurrency) {
    print(newCurrency);
    setState(() {
      controller.onCurrencySelection(newCurrency ?? currenciesList[0]);
    });
  }

  @override
  void initState() {
    controller.onCurrencySelection(currenciesList[0]);
    controller.addListener(_onCurrencyPriceListUpdated);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onCurrencyPriceListUpdated);
    controller.dispose();
    super.dispose();
  }

  void _onCurrencyPriceListUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '🤑 Coin Ticker',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: cryptos.map((crypto) {
                return Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 ${crypto.symbol} = ${!controller.hasPriceOfCrypto(crypto.id) ? '?' : controller.getPriceOfCrypto(crypto.id)} ${controller.selectedCurrency}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: getCurrencySelector(),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency = currenciesList[0];

  DropdownButton<String> getDropdownButton(
    Function(String?) onCurrencyNameSelected,
  ) {
    return DropdownButton<String>(
      value: _selectedCurrency,
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
    return null;
  }

  void onCurrencyIndexSelected(int currencyIndex) {
    onCurrencyNameSelected(currenciesList[currencyIndex]);
  }

  void onCurrencyNameSelected(String? newCurrency) {
    print(newCurrency);
    setState(() {
      _selectedCurrency = newCurrency ?? currenciesList[0];
    });
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
              children: cryptoList.map((crypto) {
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
                      '1 $crypto = ? USD',
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

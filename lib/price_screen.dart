import 'package:bitcoin_ticker/services/networking.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

// bf118cabe469da9b949c5d32ca4c3ebc727712a55aebc6813688aa2af0a5b726
// https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // Variable Declarations

  String currency = 'USD';
  String BTC = '?';
  String ETH = '?';
  String LTC = '?';
  NetworkHelper networkHelper = NetworkHelper();

  DropdownButton getAndroidMenu() {
    List<DropdownMenuItem<String>> list = [];
    for (String currency in currenciesList) {
      list.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    dynamic button = DropdownButton(
      value: currency,
      items: list,
      onChanged: (value) {
        setState(() {
          currency = value;
          setPriceData();
        });
      },
    );
    return button;
  }

  CupertinoPicker getIOSPicker() {
    List<Text> list = [];
    for (var currency in currenciesList) {
      list.add(Text(currency));
    }
    dynamic iosPicker = CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (index) {
          setState(() {
            currency = currenciesList[index];
            setPriceData();
          });
        },
        children: list);
    return iosPicker;
  }

  @override
  void initState() {
    super.initState();
    setPriceData();
  }

  void setPriceData() async {
    dynamic btc, eth, ltc;
    btc = await networkHelper.getData(
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=$currency&api_key=bf118cabe469da9b949c5d32ca4c3ebc727712a55aebc6813688aa2af0a5b726');
    eth = await networkHelper.getData(
        'https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=$currency&api_key=bf118cabe469da9b949c5d32ca4c3ebc727712a55aebc6813688aa2af0a5b726');
    ltc = await networkHelper.getData(
        'https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=$currency&api_key=bf118cabe469da9b949c5d32ca4c3ebc727712a55aebc6813688aa2af0a5b726');
    setState(() {
      BTC = btc[currency].toString();
      ETH = eth[currency].toString();
      LTC = ltc[currency].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '1 BTC = $BTC $currency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '1 ETH = $ETH $currency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '1 LTC = $LTC $currency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIOSPicker() : getAndroidMenu(),
          ),
        ],
      ),
    );
  }
}

/* 

                    

 */

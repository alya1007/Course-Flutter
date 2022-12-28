import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/networkHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  double btcRate = 0.0;
  double ethRate = 0.0;
  double ltcRate = 0.0;
  String currency = 'USD';
  String crypto = cryptoList[0];
  String url = 'https://rest.coinapi.io/v1/exchangerate/';

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItemsList = [];
    for (String currency in currenciesList) {
      dropdownItemsList.add(DropdownMenuItem(
        child: Text(currency,
            style: TextStyle(
              color: Colors.white,
            )),
        value: currency,
      ));
    }
    return DropdownButton<String>(
      value: currency,
      items: dropdownItemsList,
      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
      onChanged: (value) {
        setState(() {
          getRates();
          currency = value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerList = [];
    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          getRates();
        });
      },
      children: pickerList,
    );
  }

  void getRates() async {
    NetworkHelper helper = NetworkHelper();
    var btcData = await helper.getRate(cryptoList[0], currency);
    btcRate = btcData['rate'].floor();
    var ethData = await helper.getRate(cryptoList[1], currency);
    ethRate = ethData['rate'].floor();
    var ltcData = await helper.getRate(cryptoList[2], currency);
    ltcRate = ltcData['rate'].floor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF241566), Color(0xFF9d88f2)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                'Coin ticker'.toLowerCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 50.0),
              ),
            ),
            whiteCard(
                cryptoName: cryptoList[0],
                currencyValue: currency,
                rate: btcRate),
            whiteCard(
                cryptoName: cryptoList[1],
                currencyValue: currency,
                rate: ethRate),
            whiteCard(
                cryptoName: cryptoList[2],
                currencyValue: currency,
                rate: ltcRate),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Color(0xFFcac3e6),
              child: (!kIsWeb && Platform.isIOS)
                  ? getCupertinoPicker()
                  : getDropdownButton(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget whiteCard({cryptoName, currencyValue, rate}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            color: Color.fromARGB(255, 195, 187, 228),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              // ignore: missing_required_param
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '1 $cryptoName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 235, 235, 235),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            color: Color.fromARGB(255, 235, 235, 235),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              // ignore: missing_required_param
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '$rate $currencyValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 126, 117, 162),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

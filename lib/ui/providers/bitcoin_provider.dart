import 'package:flutter/material.dart';
import 'package:currency/common/common.dart';
import 'package:currency/models/model.dart';
import 'package:currency/service/service.dart';

class BitCoinProvider with ChangeNotifier {
  final List<String> currencyArray = ["Select", 'EUR', 'GBP', 'USD'];
  bool _isLoading = false;
  String selectedCurrency = 'Select';

  String? selectedPrice = 'Price';

  BitcoinPrice? bitcoinPrice;
  BitcoinService bitcoinService = BitcoinService();

  onCurrencyChnaged(index) {
    selectedCurrency = currencyArray[index];

    if (selectedCurrency != "Select") {
      selectedPrice = bitcoinPrice?.bpi[selectedCurrency]?.rateFloat.toStringAsFixed(2);
    } else {
      selectedPrice = 'Price';
    }

    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  getBitcoin(BuildContext context) async {
    try {
      isLoading = true;
      bitcoinPrice = await bitcoinService.getBitcoin();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      AppException.onError(e);
    }
  }
}

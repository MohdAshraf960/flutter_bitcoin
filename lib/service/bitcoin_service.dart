import 'dart:convert';

import 'package:currency/common/common.dart';
import 'package:currency/models/model.dart';
import 'package:dio/dio.dart';

class BitcoinService {
  DioClient dio = DioClient(Dio(), interceptors: []);

  Future<BitcoinPrice> getBitcoin() async {
    try {
      BitcoinPrice bitcoinPrice;
      var data = await dio.get(ApiRoutes.currentPrice);

      var decoded = jsonDecode(data);

      bitcoinPrice = BitcoinPrice.fromJson(decoded);
      return bitcoinPrice;
    } catch (e) {
      rethrow;
    }
  }
}

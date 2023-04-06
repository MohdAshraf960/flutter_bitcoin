import 'package:currency/common/common.dart';
import 'package:currency/data/models/model.dart';
import 'package:dio/dio.dart';
import 'constants/constants.dart';

class CurrencyDataSource {
  DioClient dio = DioClient(Dio(), interceptors: []);

  Future<List<BitcoinPrice>> getBitcoinList() async {
    try {
      List<BitcoinPrice> bitcoinPriceList = [];
      List data = await dio.get(CurrencyEndpoints.currentPrice);

      data.map((item) => bitcoinPriceList.add(BitcoinPrice.fromJson(item)));
      logger.d("getBitcoinList  ===> $bitcoinPriceList");
      return bitcoinPriceList;
    } catch (e) {
      rethrow;
    }
  }
}

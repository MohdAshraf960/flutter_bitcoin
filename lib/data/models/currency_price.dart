class BitcoinPrice {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Map<String, Currency> bpi;

  BitcoinPrice({required this.time, required this.disclaimer, required this.chartName, required this.bpi});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    final bpiMap = Map<String, Currency>.from(json['bpi'] ?? {});
    return BitcoinPrice(
      time: Time.fromJson(json['time'] ?? {}),
      disclaimer: json['disclaimer'] ?? '',
      chartName: json['chartName'] ?? '',
      bpi: bpiMap.map(
        (key, value) => MapEntry(key, value),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time.toJson();
    data['disclaimer'] = disclaimer;
    data['chartName'] = chartName;
    data['bpi'] = bpi.map((key, value) => MapEntry(key, value.toJson()));
    return data;
  }
}

class Time {
  final String updated;
  final String updatedISO;
  final String updatedUK;

  Time({required this.updated, required this.updatedISO, required this.updatedUK});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      updated: json['updated'] ?? '',
      updatedISO: json['updatedISO'] ?? '',
      updatedUK: json['updateduk'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['updated'] = updated;
    data['updatedISO'] = updatedISO;
    data['updateduk'] = updatedUK;
    return data;
  }
}

class Currency {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Currency({required this.code, required this.symbol, required this.rate, required this.description, required this.rateFloat});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      symbol: json['symbol'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      rateFloat: (json['rate_float'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['description'] = description;
    data['rate_float'] = rateFloat;
    return data;
  }
}

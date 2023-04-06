// class BitcoinPrice {
//   Time? _time;
//   String? _disclaimer;
//   String? _chartName;
//   Bpi? _bpi;

//   BitcoinPrice({Time? time, String? disclaimer, String? chartName, Bpi? bpi}) {
//     if (time != null) {
//       _time = time;
//     }
//     if (disclaimer != null) {
//       _disclaimer = disclaimer;
//     }
//     if (chartName != null) {
//       _chartName = chartName;
//     }
//     if (bpi != null) {
//       _bpi = bpi;
//     }
//   }

//   Time? get time => _time;
//   set time(Time? time) => _time = time;
//   String? get disclaimer => _disclaimer;
//   set disclaimer(String? disclaimer) => _disclaimer = disclaimer;
//   String? get chartName => _chartName;
//   set chartName(String? chartName) => _chartName = chartName;
//   Bpi? get bpi => _bpi;
//   set bpi(Bpi? bpi) => _bpi = bpi;

//   BitcoinPrice.fromJson(Map<String, dynamic> json) {
//     _time = json['time'] != null ? Time.fromJson(json['time']) : null;
//     _disclaimer = json['disclaimer'];
//     _chartName = json['chartName'];
//     _bpi = json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (_time != null) {
//       data['time'] = _time!.toJson();
//     }
//     data['disclaimer'] = _disclaimer;
//     data['chartName'] = _chartName;
//     if (_bpi != null) {
//       data['bpi'] = _bpi!.toJson();
//     }
//     return data;
//   }
// }

// class Time {
//   String? _updated;
//   String? _updatedISO;
//   String? _updateduk;

//   Time({String? updated, String? updatedISO, String? updateduk}) {
//     if (updated != null) {
//       _updated = updated;
//     }
//     if (updatedISO != null) {
//       _updatedISO = updatedISO;
//     }
//     if (updateduk != null) {
//       _updateduk = updateduk;
//     }
//   }

//   String? get updated => _updated;
//   set updated(String? updated) => _updated = updated;
//   String? get updatedISO => _updatedISO;
//   set updatedISO(String? updatedISO) => _updatedISO = updatedISO;
//   String? get updateduk => _updateduk;
//   set updateduk(String? updateduk) => _updateduk = updateduk;

//   Time.fromJson(Map<String, dynamic> json) {
//     _updated = json['updated'];
//     _updatedISO = json['updatedISO'];
//     _updateduk = json['updateduk'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['updated'] = _updated;
//     data['updatedISO'] = _updatedISO;
//     data['updateduk'] = _updateduk;
//     return data;
//   }
// }

// class Bpi {
//   USD? _uSD;
//   USD? _gBP;
//   USD? _eUR;

//   Bpi({USD? uSD, USD? gBP, USD? eUR}) {
//     if (uSD != null) {
//       _uSD = uSD;
//     }
//     if (gBP != null) {
//       _gBP = gBP;
//     }
//     if (eUR != null) {
//       _eUR = eUR;
//     }
//   }

//   USD? get uSD => _uSD;
//   set uSD(USD? uSD) => _uSD = uSD;
//   USD? get gBP => _gBP;
//   set gBP(USD? gBP) => _gBP = gBP;
//   USD? get eUR => _eUR;
//   set eUR(USD? eUR) => _eUR = eUR;

//   Bpi.fromJson(Map<String, dynamic> json) {
//     _uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
//     _gBP = json['GBP'] != null ? USD.fromJson(json['GBP']) : null;
//     _eUR = json['EUR'] != null ? USD.fromJson(json['EUR']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (_uSD != null) {
//       data['USD'] = _uSD!.toJson();
//     }
//     if (_gBP != null) {
//       data['GBP'] = _gBP!.toJson();
//     }
//     if (_eUR != null) {
//       data['EUR'] = _eUR!.toJson();
//     }
//     return data;
//   }
// }

// // class USD {
// //   String? _code;
// //   String? _symbol;
// //   String? _rate;
// //   String? _description;
// //   double? _rateFloat;

// //   USD({String? code, String? symbol, String? rate, String? description, double? rateFloat}) {
// //     if (code != null) {
// //       _code = code;
// //     }
// //     if (symbol != null) {
// //       _symbol = symbol;
// //     }
// //     if (rate != null) {
// //       _rate = rate;
// //     }
// //     if (description != null) {
// //       _description = description;
// //     }
// //     if (rateFloat != null) {
// //       _rateFloat = rateFloat;
// //     }
// //   }

// //   String? get code => _code;
// //   set code(String? code) => _code = code;
// //   String? get symbol => _symbol;
// //   set symbol(String? symbol) => _symbol = symbol;
// //   String? get rate => _rate;
// //   set rate(String? rate) => _rate = rate;
// //   String? get description => _description;
// //   set description(String? description) => _description = description;
// //   double? get rateFloat => _rateFloat;
// //   set rateFloat(double? rateFloat) => _rateFloat = rateFloat;

// //   USD.fromJson(Map<String, dynamic> json) {
// //     _code = json['code'];
// //     _symbol = json['symbol'];
// //     _rate = json['rate'];
// //     _description = json['description'];
// //     _rateFloat = (json['rate_float'] as num?)?.toDouble() ?? 0.0;
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['code'] = _code;
// //     data['symbol'] = _symbol;
// //     data['rate'] = _rate;
// //     data['description'] = _description;
// //     data['rate_float'] = _rateFloat;
// //     return data;
// //   }
// // }

class BitcoinPrice {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Map<String, Currency> bpi;

  BitcoinPrice({required this.time, required this.disclaimer, required this.chartName, required this.bpi});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    final bpiMap = Map<String, dynamic>.from(json['bpi'] ?? {});
    return BitcoinPrice(
      time: Time.fromJson(json['time'] ?? {}),
      disclaimer: json['disclaimer'] ?? '',
      chartName: json['chartName'] ?? '',
      bpi: bpiMap.map((key, value) => MapEntry(key, Currency.fromJson(value))),
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

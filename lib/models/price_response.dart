import 'dart:convert';

PriceResponse priceResponseFromJson(String str) =>
    PriceResponse.fromJson(json.decode(str));

String priceResponseToJson(PriceResponse data) => json.encode(data.toJson());

class PriceResponse {
  final Cryptocurrency bitcoin;
  final Cryptocurrency ethereum;
  final Cryptocurrency litecoin;

  PriceResponse({
    required this.bitcoin,
    required this.ethereum,
    required this.litecoin,
  });

  factory PriceResponse.fromJson(Map<String, dynamic> json) => PriceResponse(
    bitcoin: Cryptocurrency.fromJson(json["bitcoin"]),
    ethereum: Cryptocurrency.fromJson(json["ethereum"]),
    litecoin: Cryptocurrency.fromJson(json["litecoin"]),
  );

  Map<String, dynamic> toJson() => {
    "bitcoin": bitcoin.toJson(),
    "ethereum": ethereum.toJson(),
    "litecoin": litecoin.toJson(),
  };

  @override
  String toString() =>
      'PriceResponse(bitcoin: $bitcoin, ethereum: $ethereum, litecoin: $litecoin)';
}

class Cryptocurrency {
  final double aud;
  final double brl;
  final double cad;
  final double cny;
  final double eur;
  final double gbp;
  final double hkd;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double mxn;
  final double nok;
  final double nzd;
  final double pln;
  final double ron;
  final double rub;
  final double sek;
  final double sgd;
  final double usd;
  final double zar;

  Cryptocurrency({
    required this.aud,
    required this.brl,
    required this.cad,
    required this.cny,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.mxn,
    required this.nok,
    required this.nzd,
    required this.pln,
    required this.ron,
    required this.rub,
    required this.sek,
    required this.sgd,
    required this.usd,
    required this.zar,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => Cryptocurrency(
    aud: json["aud"]?.toDouble() ?? 0.0,
    brl: json["brl"]?.toDouble() ?? 0.0,
    cad: json["cad"]?.toDouble() ?? 0.0,
    cny: json["cny"]?.toDouble() ?? 0.0,
    eur: json["eur"]?.toDouble() ?? 0.0,
    gbp: json["gbp"]?.toDouble() ?? 0.0,
    hkd: json["hkd"]?.toDouble() ?? 0.0,
    idr: json["idr"]?.toDouble() ?? 0.0,
    ils: json["ils"]?.toDouble() ?? 0.0,
    inr: json["inr"]?.toDouble() ?? 0.0,
    jpy: json["jpy"]?.toDouble() ?? 0.0,
    mxn: json["mxn"]?.toDouble() ?? 0.0,
    nok: json["nok"]?.toDouble() ?? 0.0,
    nzd: json["nzd"]?.toDouble() ?? 0.0,
    pln: json["pln"]?.toDouble() ?? 0.0,
    ron: json["ron"]?.toDouble() ?? 0.0,
    rub: json["rub"]?.toDouble() ?? 0.0,
    sek: json["sek"]?.toDouble() ?? 0.0,
    sgd: json["sgd"]?.toDouble() ?? 0.0,
    usd: json["usd"]?.toDouble() ?? 0.0,
    zar: json["zar"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "aud": aud,
    "brl": brl,
    "cad": cad,
    "cny": cny,
    "eur": eur,
    "gbp": gbp,
    "hkd": hkd,
    "idr": idr,
    "ils": ils,
    "inr": inr,
    "jpy": jpy,
    "mxn": mxn,
    "nok": nok,
    "nzd": nzd,
    "pln": pln,
    "ron": ron,
    "rub": rub,
    "sek": sek,
    "sgd": sgd,
    "usd": usd,
    "zar": zar,
  };

  double currencyValue(String currency) => switch (currency.toLowerCase()) {
    'aud' => aud,
    'brl' => brl,
    'cad' => cad,
    'cny' => cny,
    'eur' => eur,
    'gbp' => gbp,
    'hkd' => hkd,
    'idr' => idr,
    'ils' => ils,
    'inr' => inr,
    'jpy' => jpy,
    'mxn' => mxn,
    'nok' => nok,
    'nzd' => nzd,
    'pln' => pln,
    'ron' => ron,
    'rub' => rub,
    'sek' => sek,
    'sgd' => sgd,
    'usd' => usd,
    'zar' => zar,
    _ => throw ArgumentError('Unsupported currency: $currency'),
  };

  @override
  String toString() =>
      'Cryptocurrency(aud: $aud, brl: $brl, cad: $cad, cny: $cny, eur: $eur, '
      'gbp: $gbp, hkd: $hkd, idr: $idr, ils: $ils, inr: $inr, jpy: $jpy, '
      'mxn: $mxn, nok: $nok, nzd: $nzd, pln: $pln, ron: $ron, rub: $rub, '
      'sek: $sek, sgd: $sgd, usd: $usd, zar: $zar)';
}

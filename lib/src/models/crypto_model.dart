class CryptoModel {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final double? marketCap;
  final int? marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final Map<String, dynamic>? roi;
  final DateTime? lastUpdated;
  final double? priceChangePercentage1hInCurrency;

  CryptoModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
    this.priceChangePercentage1hInCurrency,
  });

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(
      id: map['id'] as String?,
      symbol: map['symbol'] as String?,
      name: map['name'] as String?,
      image: map['image'] as String?,
      currentPrice: (map['current_price'] as num?)?.toDouble(),
      marketCap: (map['market_cap'] as num?)?.toDouble(),
      marketCapRank: (map['market_cap_rank'] as num?)?.toInt(),
      fullyDilutedValuation: (map['fully_diluted_valuation'] as num?)?.toDouble(),
      totalVolume: (map['total_volume'] as num?)?.toDouble(),
      high24h: (map['high_24h'] as num?)?.toDouble(),
      low24h: (map['low_24h'] as num?)?.toDouble(),
      priceChange24h: (map['price_change_24h'] as num?)?.toDouble(),
      priceChangePercentage24h: (map['price_change_percentage_24h'] as num?)?.toDouble(),
      marketCapChange24h: (map['market_cap_change_24h'] as num?)?.toDouble(),
      marketCapChangePercentage24h: (map['market_cap_change_percentage_24h'] as num?)?.toDouble(),
      circulatingSupply: (map['circulating_supply'] as num?)?.toDouble(),
      totalSupply: (map['total_supply'] as num?)?.toDouble(),
      maxSupply: (map['max_supply'] as num?)?.toDouble(),
      ath: (map['ath'] as num?)?.toDouble(),
      athChangePercentage: (map['ath_change_percentage'] as num?)?.toDouble(),
      athDate: map['ath_date'] != null ? DateTime.tryParse(map['ath_date'] as String) : null,
      atl: (map['atl'] as num?)?.toDouble(),
      atlChangePercentage: (map['atl_change_percentage'] as num?)?.toDouble(),
      atlDate: map['atl_date'] != null ? DateTime.tryParse(map['atl_date'] as String) : null,
      roi: map['roi'] != null ? Map<String, dynamic>.from(map['roi'] as Map) : null,
      lastUpdated: map['last_updated'] != null ? DateTime.tryParse(map['last_updated'] as String) : null,
      priceChangePercentage1hInCurrency: (map['price_change_percentage_1h_in_currency'] as num?)?.toDouble(),
    );
  }

  static List<CryptoModel> fromList(List<dynamic> list) {
    return list.map((item) => CryptoModel.fromMap(item as Map<String, dynamic>)).toList();
  }
}
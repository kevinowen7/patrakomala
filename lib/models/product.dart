part of 'models.dart';

class Product extends Equatable {
  final String produkNm;
  final int produkStatus;
  final int userId;
  final String produkDesc;
  final String produkImg;
  final String produkUrl;
  final int produkId;
  final int produkSubsector;
  final String produkSlug;
  final String subsector;
  final int counters;

  Product({
    this.produkNm,
    this.produkStatus,
    this.userId,
    this.produkDesc,
    this.produkImg,
    this.produkUrl,
    this.produkId,
    this.produkSubsector,
    this.produkSlug,
    this.subsector,
    this.counters,
  });

  Product copyWith({
    String produkNm,
    int produkStatus,
    int userId,
    String produkDesc,
    String produkImg,
    String produkUrl,
    int produkId,
    int produkSubsector,
    String produkSlug,
    String subsector,
    int counters
  }) =>
      Product(
        produkNm: produkNm ?? this.produkNm,
        produkStatus: produkStatus ?? this.produkStatus,
        userId: userId ?? this.userId,
        produkDesc: produkDesc ?? this.produkDesc,
        produkImg: produkImg ?? this.produkImg,
        produkUrl: produkUrl ?? this.produkUrl,
        produkId: produkId ?? this.produkId,
        produkSubsector: produkSubsector ?? this.produkSubsector,
        produkSlug: produkSlug ?? this.produkSlug,
        subsector: subsector ?? this.subsector,
        counters: counters ?? this.counters,
      );

  factory Product.fromJson(Map<String, dynamic> data) => Product(
    produkNm: data['produk_nm'],
    produkStatus : data['produk_status'],
    userId: data['user_id'],
    produkDesc: data['produk_desc'],
    produkImg: data['produk_img'],
    produkUrl: data['produk_url'],
    produkId: data['produk_id'],
    produkSubsector: data['produk_subsector'],
    subsector: data['subsector'],
    counters: data['counter'],
  );

  @override
  List<Object> get props => [
        produkNm,
        produkStatus,
        userId,
        produkDesc,
        produkImg,
        produkUrl,
        produkId,
        produkSubsector,
        produkSlug,
        subsector,
        counters,
      ];
}

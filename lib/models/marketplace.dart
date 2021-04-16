part of 'models.dart';

class MarketPlaceProduct extends Equatable {
  final String urlNm;
  final String img;
  MarketPlaceProduct({
    this.urlNm,
    this.img,
  });

  factory MarketPlaceProduct.fromJson(Map<String, dynamic> json) =>
      MarketPlaceProduct(
        urlNm: json["url_nm"],
        img: json["img"],
      );

  @override
  List<Object> get props => [urlNm, img];
}

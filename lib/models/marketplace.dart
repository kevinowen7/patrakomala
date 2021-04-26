part of 'models.dart';

class MarketPlaceProduct extends Equatable {
  final String urlNm;
  final String img;
  final String name;
  MarketPlaceProduct({
    this.urlNm,
    this.img,
    this.name,
  });

  factory MarketPlaceProduct.fromJson(Map<String, dynamic> json) =>
      MarketPlaceProduct(
        urlNm: json["url_nm"],
        img: json["img"],
        name: json["name"],
      );

  @override
  List<Object> get props => [urlNm, img,name];
}

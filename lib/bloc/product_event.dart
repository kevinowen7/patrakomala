part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class FetchProduct extends ProductEvent{
  @override
  List<Object> get props => [];
}

class FilterProduct extends ProductEvent{
  final produkName;
  final List<String> subsector;

  FilterProduct({this.produkName,this.subsector});
  @override
  List<Object> get props => [produkName,subsector];
}

class DetailProduct extends ProductEvent{
  final productId;

  DetailProduct(this.productId);
  @override
  List<Object> get props => [productId];
}





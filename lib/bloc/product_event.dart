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
  final subsector;

  FilterProduct({this.produkName,this.subsector});
  @override
  List<Object> get props => [produkName,subsector];
}



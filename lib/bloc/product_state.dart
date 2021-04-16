part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final ApiReturnValue<List<Product>> products;

  ProductLoaded({this.products});

  @override
  List<Object> get props => [products];
}

class ProductFilterLoaded extends ProductState {
  final ApiReturnValue<List<Product>> products;

  ProductFilterLoaded({this.products});

  @override
  List<Object> get props => [products];
}



class ProductDetailLoaded extends ProductState {
  final Product product;
  ProductDetailLoaded(this.product);

  @override
  List<Object> get props => [product];

}

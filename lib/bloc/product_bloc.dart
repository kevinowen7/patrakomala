import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is FetchProduct) {
      ApiReturnValue<List<Product>> products =
          await ProductServices.getProduct(1);
      yield(ProductLoaded(products: products));
    } else if (event is FilterProduct) {
      ApiReturnValue<List<Product>> products =
          await ProductServices.filterProduct(
              1, event.produkName, event.subsector);
      yield(ProductFilterLoaded(products: products));
    } else if(event is ProductBisnis){
      ApiReturnValue<List<Product>> products =
          await ProductServices.getProductBisnis(event.bisnisId);
      yield(ProductLoaded(products: products));
    }
  }
}

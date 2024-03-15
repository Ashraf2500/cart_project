import 'package:bloc/bloc.dart';
import 'package:cart_project/repository/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductModel> cartProducts = [];

  void addToCart (BuildContext context,ProductModel product){
      cartProducts.add(product);

      emit(AddToCartState(product: product));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.title} added to cart'),
          duration: const Duration(seconds: 2,),
        ),
      );
  }

  void deleteFromCart (BuildContext context,ProductModel product){
    cartProducts.remove(product);
    emit(DeleteFromCartState());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} removed from cart'),
        duration: const Duration(seconds: 2),
      ),
    );

  }
}

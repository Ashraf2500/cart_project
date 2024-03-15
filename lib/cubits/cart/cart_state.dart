part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartState extends CartState {
  ProductModel product ;
  AddToCartState({required this.product});
}
class DeleteFromCartState extends CartState {}

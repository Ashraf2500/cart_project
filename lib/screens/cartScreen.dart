
import 'package:cart_project/repository/models/product_model.dart';
import 'package:cart_project/repository/repo/repo_data.dart';
import 'package:cart_project/screens/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart/cart_cubit.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  bool _isExistInCart = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 12.0 , bottom: 30),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            List<ProductModel> products = context.read<CartCubit>().cartProducts;
            return (products.isNotEmpty)
                ?ListView.builder(
                itemCount: products.length,
                itemBuilder: (context , index){
                  return CustomProductItem(index: index,items: products ,isExistInCart: true);
            }
        )
                :const Center(
              child:  Text(
                'The cart is Empty !',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
            );
  },
),
      ),
    );
  }
}

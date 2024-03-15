import 'package:cart_project/cubits/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/models/product_model.dart';
import '../repository/repo/repo_data.dart';

class CustomProductItem extends StatelessWidget {
   CustomProductItem({
    super.key,
    required this.index,
    required this.items,
    this.isExistInCart = false,

  });

  final int index;
  final bool isExistInCart ;
  final List<ProductModel> items ;


   @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Card(
      color: (isExistInCart)?const Color(0xffedf7ee) : const Color(0xffe6fffc),
      margin:  EdgeInsets.symmetric(horizontal: widthScreen*0.045, vertical: 8),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.03,vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: heightScreen*0.15,
              width: widthScreen*0.3,
              padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.04,vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                items[index].image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: widthScreen*0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: widthScreen*0.35,
                  child: Text(
                    items[index].title,
                    //overflow: TextOverflow.ellipsis ,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                SizedBox(
                  height: heightScreen*0.01,
                ),
                Text(
                  "${items[index].price} \$",
                  style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: (){
                if(isExistInCart){
                  context.read<CartCubit>().deleteFromCart(context,items[index]);
                }else{
                  print("must add");
                  context.read<CartCubit>().addToCart(context,items[index]);
                }
              },
            icon: isExistInCart?const Icon(Icons.delete_outline):const Icon(Icons.add_shopping_cart_outlined),
                        ),
          ],
        ),
      ),
    );
  }
}
import 'package:cart_project/repository/repo/repo_data.dart';
import 'package:cart_project/screens/cartScreen.dart';
import 'package:cart_project/screens/custom_product_item.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
            'All Products',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return  CartScreen();}));
            },
            icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0 , bottom: 30),
        child: ListView.builder(
          itemCount: homeProducts.length,
            itemBuilder: (context , index){
              return CustomProductItem(index: index,items: homeProducts,);
            }
        ),
      ),
    );
  }
}


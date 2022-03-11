import 'package:addcart/model/model.dart';
import 'package:flutter/material.dart';
class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel>_valueSetter;
  ProductScreen(this._valueSetter);
  List<ProductModel>products=[
    ProductModel("Pulser", 18000),
    ProductModel("CBR", 18000),
    ProductModel("Repsol", 480000),
    ProductModel("Pulser", 18000),
    ProductModel("Pulser", 18000),
    ProductModel("Pulser", 18000),
    ProductModel("Pulser", 18000),

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].name!),
            trailing: Text("${products[index].price}",

            ),
            onTap: (){
              _valueSetter(products[index]);
            },
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
        itemCount: products.length);
  }
}

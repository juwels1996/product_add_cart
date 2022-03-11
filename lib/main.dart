import 'package:addcart/screen/cartpage.dart';
import 'package:addcart/screen/home.dart';
import 'package:addcart/model/cardmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp(
  model: CartModel(),
));


class MyApp extends StatelessWidget{

  final CartModel model;

  const MyApp({Key ?key, required this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: HomePage(),
        routes: {'/cart': (context) => CartPage()},
      ),
    );
  }
}
import 'package:addcart/model/cardmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Dragon",
        price: 20.0,
        imgUrl: "https://media.istockphoto.com/photos/isolated-red-fleshed-dragon-fruit-picture-id1129173897?k=20&m=1129173897&s=612x612&w=0&h=KMQXGXrGo8dVcEcYHlNbvj5u82zRj4y5WZ59wKJrJgA=",
        qty: 1),
    Product(
        id: 2,
        title: "Kiwi",
        price: 40.0,
        imgUrl: "http://www.cellsii.com/images/detailed/17/kiwi-fruits.jpg",
        qty: 1),
    Product(
        id: 3,
        title: "strawbery",
        price: 20.0,
        imgUrl: "https://cbsnews3.cbsistatic.com/hub/i/r/2011/08/09/41d38b83-8ba7-11e2-9400-029118418759/thumbnail/640x480/731a53ce6caa21283c0db1c7e5fa72fd/es_strawberries_809.jpg",
        qty: 1),
    Product(
        id: 4,
        title: "Dalim",
        price: 40.0,
        imgUrl: "https://info.ehl.edu/hubfs/Blog-EHL-Insights/Article-Header-EHL-Insights/slowest-perishable-vegetables-fruits.jpeg",
        qty: 1),
    Product(
        id: 5,
        title: "Avocado",
        price: 25.0,
        imgUrl: "http://www.cellsii.com/images/detailed/20/Avocado-Fruits-Price-in-bangladesh.jpg",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Addcart"),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () => Navigator.pushNamed(context, '/cart'),
          // )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                return Card(
                    child: Column( children: <Widget>[
                  Image.network(_products[index].imgUrl!, height: 120, width: 120,),
                  Text(_products[index].title!, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("\$"+_products[index].price.toString()),
                  OutlineButton(
                      child: Text("Add"),
                      onPressed: () => model.addProduct(_products[index]))
                ]));
              });
        },
      ),

    );
  }
}
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  int ?id;
  String ?title;
  String ?imgUrl;
  double ?price;
  int ?qty;

  Product({this.id, this.title, this.price, this.qty, this.imgUrl});
}

class CartModel extends Model {
  List<Product> cart = [];
  double totalCartValue = 0;
  int _counter=0;
  double _totalPrice = 0.0 ;
  double get totalPrice => _totalPrice;
  int get counter=>_counter;

  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1)
      updateProduct(product, product.qty + 1);
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0)
      removeProduct(product);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price! * f.qty!;
    });
  }
  void _getPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }
  int getCounter (){
    _getPrefItems();
    return  _counter ;

  }
  getBasketQty(){
    int total=0;
    for(int i=0; i<cart.length;i++){
      total +=cart[i].qty!;
    }
    return total;
  }
}


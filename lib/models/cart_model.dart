import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual_cliente/data/cart_product.dart';
import 'package:loja_virtual_cliente/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {

  UserModel user;

  List<CartProduct> products = [];

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  CartModel(this.user);

  void addCartItem(CartProduct cartProduct){
    products.add(cartProduct);

    Firestore.instance.collection("user").document(user.firebaseUser.uid).collection("cart").add(cartProduct.toMap()).then((doc) {
      cartProduct.cid = doc.documentID;
    });

    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct){
    Firestore.instance.collection("user").document(user.firebaseUser.uid).collection("cart").document(cartProduct.cid).delete();

    products.remove(cartProduct);

    notifyListeners();
  }

}
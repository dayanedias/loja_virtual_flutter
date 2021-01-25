import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual_cliente/data/product_data.dart';

class CartProduct {
  String cid;
  String category;
  String pid;

  int quantity;
  String size;

  CartProduct();

  ProductData productData;

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "pid": pid,
      "quantify": quantity,
      "size": size,
      "product": productData.toResumedMap()
    };
  }

}
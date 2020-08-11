import 'package:flutter/material.dart';
import 'package:loja_virtual_cliente/tabs/home_tab.dart';
import 'package:loja_virtual_cliente/tabs/products_tab.dart';
import 'package:loja_virtual_cliente/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      //physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
      ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Meus pedidos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(),
        )
      ],
    );
  }
}



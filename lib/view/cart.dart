import 'package:flutter/material.dart';
import 'package:shopping_app_sample/widgets/appbar.dart';
import 'package:shopping_app_sample/widgets/bottom_navigation_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBarWidget(title: 'Shopping Cart'),
        ),
        bottomNavigationBar: BottomNavigationBarWidget());
  }
}

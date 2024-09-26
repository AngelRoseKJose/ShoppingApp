import 'package:flutter/material.dart';
import 'package:shopping_app_sample/view/cart.dart';
import 'package:shopping_app_sample/view/favorites.dart';
import 'package:shopping_app_sample/view/home_page.dart';
import 'package:shopping_app_sample/widgets/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});

  final  _pages=[const HomePage(),
  const FavouritesPage(),
  const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ValueListenableBuilder(valueListenable: indexChangeNotifier, 
    builder:(context, index, child) {
      return _pages[index];
    }),bottomNavigationBar:const BottomNavigationBarWidget(),);
  }
}
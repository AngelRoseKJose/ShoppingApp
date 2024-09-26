
import 'package:flutter/material.dart';
import 'package:shopping_app_sample/constants/color_constants.dart';
final ValueNotifier indexChangeNotifier=ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexChangeNotifier,builder: (context, newIndex , child) {
      return BottomNavigationBar(onTap: (index){indexChangeNotifier.value=index;},
        currentIndex: newIndex,
        selectedItemColor: ColorConstants.selectionColor,
        unselectedItemColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        items: const
      [BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home',),
      BottomNavigationBarItem(icon: Icon(Icons.favorite),label:'favourites'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'cart')]);}
     
    );
  }
}
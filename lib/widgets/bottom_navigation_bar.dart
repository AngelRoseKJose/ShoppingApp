
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app_sample/constants/color_constants.dart';
final ValueNotifier indexChangeNotifier=ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
     return Container(color: ColorConstants.primaryColor,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [IconButton(onPressed: (){context.goNamed('home');}, icon: Icon(Icons.home,color: ColorConstants.secondaryColor,)),
    IconButton(onPressed: (){context.goNamed('favourites');}, icon: Icon(Icons.favorite,color: ColorConstants.secondaryColor)),
    IconButton(onPressed: (){context.goNamed('cart');}, icon: Icon(Icons.shopping_cart,color: ColorConstants.secondaryColor))],),);
  }
}
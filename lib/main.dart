import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_sample/controller/product_controller.dart';
import 'package:shopping_app_sample/view/cart.dart';
import 'package:shopping_app_sample/view/favorites.dart';
import 'package:shopping_app_sample/view/home_page.dart';
import 'package:shopping_app_sample/view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
   
    return MultiProvider( providers: [ ChangeNotifierProvider(create: (_) => ProductProvider()),],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      // routerConfig: _goRouter,
      home: HomePage(),
      ),
    );
    
  }
}

//  final _goRouter = GoRouter(
//   initialLocation: 'home',
//       routes: [
//         GoRoute(
//           name: 'home',
//           path: '/home',
//           builder: (context, state) =>const HomePage(),
//         ),
//         GoRoute(
//           name: 'favourites',
//           path: '/favourites',
//           builder: (context, state) =>const FavouritesPage(),
//         ),
//           GoRoute(
//           name: 'cart',
//           path: '/cart',
//           builder: (context, state) =>const CartPage(),
//         ),
//       ],
//     );
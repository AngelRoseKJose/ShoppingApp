import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_sample/controller/product_controller.dart';
import 'package:shopping_app_sample/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
     getData();
  }

  void getData() async {
    await Provider.of<ProductProvider>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBarWidget(title: 'Products'),
        ),
        body: SafeArea(child: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return Center(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(products.productList[index].brand),
                      subtitle: Text(products.productList[index].title),
                      leading: (Image(
                          image: NetworkImage(
                              products.productList[index].images.first))));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 6,
                  );
                },
                itemCount: products.productList.length,
              ),
            );
          },
        )));
  }
}

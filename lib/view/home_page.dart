import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_sample/controller/product_controller.dart';
import 'package:shopping_app_sample/widgets/appbar.dart';
import 'package:shopping_app_sample/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      getData();
    });
    _scrollController = ScrollController();
    _scrollController.addListener(loadMore);
  }

  void loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    }
  }

  void getData() async {
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBarWidget(title: 'Products'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                return productProvider.isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: Center(
                          child: ListView.separated(
                            controller: _scrollController,
                            key: const PageStorageKey<String>('listViewKey'),
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                      products.productList[index].brand ??
                                          'null'),
                                  subtitle:
                                      Text(products.productList[index].title),
                                  leading: (Image(
                                      image: NetworkImage(products
                                          .productList[index].images.first))));
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 6,
                              );
                            },
                            itemCount: products.productList.length,
                          ),
                        ),
                      );
              },
            ),
          ],
        )),
        bottomNavigationBar: const BottomNavigationBarWidget());
  }
}

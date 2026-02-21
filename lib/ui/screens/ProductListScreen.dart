import 'package:apicalldemo/providers/Providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/response/ProductResponse.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Future(getProductList);
  }

  Future<void> getProductList() async {
    await ref.read(productListViewModelProvider.notifier).getProductList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Center(
        child: state.isLoading
            ? const CircularProgressIndicator()
            : state.error != null
                ? Text('Error: ${state.error}')
                : state.data == null
                    ? const Text('No products found.')
                    : ListView.builder(
                        itemCount: state.data!.products.length,
                        itemBuilder: (context, index) {
                          final product = state.data!.products[index];
                          return ListTile(
                            title: Text(product.title ?? ''),
                            subtitle: Text(product.description ?? ''),
                            leading: product.thumbnail != null
                                ? Image.network(product.thumbnail!)
                                : null,
                          );
                        },
                      ),
      ),
    );
  }
}

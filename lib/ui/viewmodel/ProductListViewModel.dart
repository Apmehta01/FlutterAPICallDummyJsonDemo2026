import 'package:apicalldemo/core/network/ApiStates.dart';
import 'package:apicalldemo/data/model/response/ProductResponse.dart';
import 'package:apicalldemo/domain/ProductListRepository.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProductListViewmodel extends StateNotifier<ApiState> {
  final ProductListRepository productListRepository;

  ProductListViewmodel(this.productListRepository) : super(const ApiState());

  Future<void> getProductList() async {
    try {
      state = state.copyWith(
        isLoading: true,
        data: () => ProductResponse(),
        error: null,
        request: null,
      );

      final response = await productListRepository.getProductList();

      state = state.copyWith(
        isLoading: false,
        data: () => response,
        error: null,
        request: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        data: () => ProductResponse(),
        error: () => e.toString(),
        request: null,
      );
    }
  }
}

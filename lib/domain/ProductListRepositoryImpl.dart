import 'package:apicalldemo/core/network/web/ApiService.dart';
import 'package:apicalldemo/data/model/response/ProductResponse.dart';
import 'package:apicalldemo/domain/ProductListRepository.dart';

class ProductListRepositoryImpl implements ProductListRepository {
  final ApiService apiService;

  ProductListRepositoryImpl(this.apiService);

  @override
  Future<ProductResponse> getProductList() {
    return apiService.getProductList();
  }
}

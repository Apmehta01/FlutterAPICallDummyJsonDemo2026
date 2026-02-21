
import 'package:apicalldemo/data/model/response/ProductResponse.dart';

abstract class ProductListRepository {
  Future<ProductResponse>getProductList();
}

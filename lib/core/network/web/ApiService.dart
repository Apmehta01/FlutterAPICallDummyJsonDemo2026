
import 'package:apicalldemo/data/model/request/LoginRequest.dart';
import 'package:apicalldemo/data/model/response/LoginResponse.dart';
import 'package:apicalldemo/data/model/response/ProductResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart' show RestApi;

import '../../constants/Constants.dart';
part 'ApiService.g.dart';

@RestApi(baseUrl:Constants.baseUrl)
abstract class ApiService{

  factory ApiService(Dio dio,{String baseUrl}) = _ApiService;

  @POST(Constants.authAPI)
  Future<LoginResponse>login(@Body() LoginRequest loginRequest);

  @GET(Constants.productAPI)
  Future<ProductResponse>getProductList();
}
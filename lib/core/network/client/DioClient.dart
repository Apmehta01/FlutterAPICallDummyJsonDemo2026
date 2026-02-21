import 'package:dio/dio.dart';

import '../../constants/Constants.dart';

class DioClient {
  DioClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      headers: {Constants.contentTypeKey: Constants.contentTypeValue},
    ),
  )
    ..interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
}

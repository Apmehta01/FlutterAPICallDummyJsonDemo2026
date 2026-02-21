import 'package:apicalldemo/core/network/ApiStates.dart';
import 'package:apicalldemo/core/network/web/ApiService.dart';
import 'package:apicalldemo/domain/LoginRepository.dart';
import 'package:apicalldemo/domain/LoginRepositoryImpl.dart';
import 'package:apicalldemo/domain/ProductListRepositoryImpl.dart';
import 'package:apicalldemo/ui/viewmodel/LoginViewModel.dart';
import 'package:apicalldemo/ui/viewmodel/ProductListViewModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/network/client/DioClient.dart';
import '../data/model/request/LoginRequest.dart';
import '../data/model/response/LoginResponse.dart';
import '../domain/ProductListRepository.dart';

final dioProvider = Provider<Dio>((ref) => DioClient.dio);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioProvider)),
);

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(ref.read(apiServiceProvider)),
);

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, ApiState>(
  (ref) => LoginViewModel(ref.read(loginRepositoryProvider)),
);

final productListRepositoryProvider = Provider<ProductListRepository>(
  (ref) => ProductListRepositoryImpl(ref.read(apiServiceProvider)),
);

final productListViewModelProvider = StateNotifierProvider<ProductListViewmodel, ApiState>(
  (ref) => ProductListViewmodel(ref.read(productListRepositoryProvider)),
);




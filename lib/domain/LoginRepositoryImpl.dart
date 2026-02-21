import 'package:apicalldemo/core/network/web/ApiService.dart';
import 'package:apicalldemo/data/model/request/LoginRequest.dart';
import 'package:apicalldemo/data/model/response/LoginResponse.dart';
import 'package:apicalldemo/domain/LoginRepository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;

  LoginRepositoryImpl(this.apiService);

  @override
  Future<LoginResponse> performLogin(LoginRequest loginRequest) {
    return apiService.login(loginRequest);
  }
}

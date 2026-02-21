
import 'package:apicalldemo/data/model/request/LoginRequest.dart';
import 'package:apicalldemo/data/model/response/LoginResponse.dart';

abstract class LoginRepository {
  Future<LoginResponse>performLogin(LoginRequest loginRequest);
}
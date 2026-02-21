import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateNotifier;

import '../../core/constants/Constants.dart';
import '../../core/network/ApiStates.dart';
import '../../data/model/request/LoginRequest.dart';
import '../../data/model/response/LoginResponse.dart';
import '../../domain/LoginRepository.dart';

class LoginViewModel extends StateNotifier<ApiState<LoginResponse, LoginRequest>> {
  final LoginRepository loginRepository;

  LoginViewModel(this.loginRepository)
      : super(const ApiState());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final user = username.trim();
    final pass = password.trim();

    if (user.isEmpty || pass.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        error: () => 'Username and password are required',
        data: () => null,
        request: () => null,
      );
      return;
    }

    // Optional demo validation (keep/remove as you like)
    if (user != Constants.demoUsername || pass != Constants.demoPassword) {
      state = state.copyWith(
        isLoading: false,
        error: () =>
        'Invalid credentials. Use username "${Constants.demoUsername}" and password "${Constants.demoPassword}".',
        data: () => null,
        request: () => null,
      );
      return;
    }

    final req = LoginRequest(username: user, password: pass);

    try {
      state = state.copyWith(
        isLoading: true,
        error: () => null,
        request: () => req,
        data: () => LoginResponse(),
      );

      // ✅ Call repository instead of apiService
      final response = await loginRepository.performLogin(req);

      state = state.copyWith(
        isLoading: false,
        data: () => response,
        error: () => null,
        request: () => req,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: () => 'Login failed. Please try again.',
        data: () => null,
        request: () => req,
      );
    }
  }

  String? get token => state.data?.accessToken;

  void reset() {
    state = state.copyWith(
      isLoading: false,
      data: () => null,
      error: () => null,
      request: () => null,
    );
  }
}
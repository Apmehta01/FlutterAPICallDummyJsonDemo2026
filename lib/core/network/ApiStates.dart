class ApiState<T, R> {
  final bool isLoading;
  final T? data;
  final String? error;
  final R? request;

  const ApiState({
    this.isLoading = false,
    this.data,
    this.error,
    this.request,
  });

  ApiState<T, R> copyWith({
    bool? isLoading,
    T? Function()? data,
    String? Function()? error,
    R? Function()? request,
  }) {
    return ApiState<T, R>(
      isLoading: isLoading ?? this.isLoading,
      data: data != null ? data() : this.data,
      error: error != null ? error() : this.error,
      request: request != null ? request() : this.request,
    );
  }
}
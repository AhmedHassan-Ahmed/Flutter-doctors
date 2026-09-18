abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> data;

  AuthSuccess(this.data);
}

class AuthFail extends AuthState {
  final String message;

  AuthFail(this.message);
}

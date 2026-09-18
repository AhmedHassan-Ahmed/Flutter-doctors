import 'package:flutter_app/features/auth/data/repositories/auth_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImplement authRepo = AuthRepoImplement();

  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    emit(AuthLoading());

    try {
      final data = await authRepo.login(email: email, password: password);
      await prefs.setString('token', data['data']["token"].toString());
      print(data['data']["token"].toString());
      emit(AuthSuccess(data));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String gender,
  }) async {
    emit(AuthLoading());
    final prefs = await SharedPreferences.getInstance();

    try {
      final data = await authRepo.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
        gender: gender,
      );
      await prefs.setString('token', data['data']["token"].toString());
      print(data['data']["token"].toString());
      emit(AuthSuccess(data));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }
}

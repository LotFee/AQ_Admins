import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.auth) : super(LoginInitial());
  final AuthRepository auth;

  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await auth.login('123', '123');
    result.fold(
        (l) => emit(LoginErrorState(l)), (r) => emit(LoginSuccessState(r)));
  }
}

import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/injection_container.dart';
import 'package:aq_admin/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text('Hello, this is Login page'),
          const SizedBox(height: 20.0),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                logger.error(state.failure.error);
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is LoginSuccessState) {
                return Text(state.user.toJson());
              }
              return ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().login();
                  },
                  child: const Text('login'));
            },
          )
        ],
      ),
    );
  }
}

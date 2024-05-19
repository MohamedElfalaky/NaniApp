import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/login/cubit/login_cubit.dart';

import 'login_view.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (_) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (_, state) => LoginView(),
        ),
      ),
    );
  }
}

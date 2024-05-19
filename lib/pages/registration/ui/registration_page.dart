import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';

import 'registration_view.dart';

final class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (_, state) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: const RegistrationView()),
      ),
    );
  }
}

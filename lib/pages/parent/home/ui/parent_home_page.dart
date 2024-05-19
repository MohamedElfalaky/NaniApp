import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/parent/home/cubit/parent_home_cubit.dart';

import 'parent_home_view.dart';

final class ParentHomePage extends StatelessWidget {
  const ParentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ParentHomeCubit(),
      child: BlocBuilder<ParentHomeCubit, ParentHomeState>(
        builder: (_, state) => ParentHomeView(),
      ),
    );
  }
}

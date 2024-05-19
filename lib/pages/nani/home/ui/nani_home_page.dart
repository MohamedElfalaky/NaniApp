import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/nani/home/cubit/nani_home_cubit.dart';

import 'nani_home_view.dart';

final class NaniHomePage extends StatelessWidget {
  const NaniHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NaniHomeCubit(),
      child: BlocBuilder<NaniHomeCubit, NaniHomeState>(
        builder: (_, state) => NaniHomeView(),
      ),
    );
  }
}

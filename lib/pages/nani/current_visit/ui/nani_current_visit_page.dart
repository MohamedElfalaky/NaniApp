import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/nani/current_visit/cubit/nani_current_visit_cubit.dart';

import 'nani_current_visit_view.dart';

final class NaniCurrentVisitPage extends StatelessWidget {
  const NaniCurrentVisitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NaniCurrentVisitCubit(),
      child: BlocBuilder<NaniCurrentVisitCubit, NaniCurrentVisitState>(
        builder: (_, state) => NaniCurrentVisitView(),
      ),
    );
  }
}

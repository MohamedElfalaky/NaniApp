import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/parent/request_done/cubit/request_done_cubit.dart';

import 'request_done_view.dart';

final class RequestDonePage extends StatelessWidget {
  const RequestDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RequestDoneCubit(),
      child: BlocBuilder<RequestDoneCubit, RequestDoneState>(
        builder: (_, state) => RequestDoneView(),
      ),
    );
  }
}

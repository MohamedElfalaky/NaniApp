import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/nani/nani_sending_request/cubit/nani_sending_request_cubit.dart';
import 'package:parent_app/pages/nani/nani_sending_request/ui/nani_sending_request_view.dart';

final class NaniSendingRequestPage extends StatelessWidget {
  const NaniSendingRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NaniSendingRequestCubit(),
      child: BlocBuilder<NaniSendingRequestCubit, NaniSendingRequestState>(
        builder: (_, state) => NaniSendingRequestView(),
      ),
    );
  }
}

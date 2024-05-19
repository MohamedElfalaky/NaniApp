import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/parent/sending_request/cubit/sending_request_cubit.dart';

import 'sending_request_view.dart';

final class SendingRequestPage extends StatelessWidget {
  const SendingRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SendingRequestCubit(),
      child: BlocBuilder<SendingRequestCubit, SendingRequestState>(
        builder: (_, state) => SendingRequestView(),
      ),
    );
  }
}

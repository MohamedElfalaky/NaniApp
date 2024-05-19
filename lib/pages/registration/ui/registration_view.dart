import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/nani/nani_activities_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/nani/nani_basic_info_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/nani/nani_documents_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/nani/nani_payment_billing.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/nani/nani_work_preferences_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/parent/parent_basic_info_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/parent/parent_location_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/parent/parent_children.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/parent/parent_payment.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/common/terms_and_conditions_page.dart';
import 'package:parent_app/pages/registration/ui/registrationPages/common/congratulation_page.dart';
import 'package:parent_app/util/globals.dart';

final class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

final class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller:
            context.read<RegistrationCubit>().registrationPageController,
        children: !isNani
            ? [
                ParentBasicInfoPage(),
                ParentLocationPage(),
                ParentChildren(),
                ParentPayment(),
                TermsAndConditionsPage(),
                CongratulationPage()
              ]
            : [
                NaniBasicInfoPage(),
                NaniActivitiesPage(),
                NaniWorkPrferancePage(),
                NaniDocumentsPage(),
                NaniPaymentPage(),
                TermsAndConditionsPage(),
                CongratulationPage()
              ],
      )),
    );
  }
}

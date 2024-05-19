import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/myApplication.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/util/globals.dart';

class TermsAndConditionsPage extends StatefulWidget {
  TermsAndConditionsPage({
    super.key,
  });

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage>
    with AutomaticKeepAliveClientMixin<TermsAndConditionsPage> {
  final _registrationFormKey = GlobalKey<FormState>();

  bool _acceptTermsAndConditions = false;
  bool _acceptCamera = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccess) {
          context.read<RegistrationCubit>().nextPage();

          if (!isNani) {
            MyApplication.showToastView(
                message: "Parent registered Successfully");
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Terms & Conditions"),
          leading: BackButton(
            onPressed: () {
              context.read<RegistrationCubit>().previousPage();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSpaces.padding_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _registrationFormKey,
                child: Column(
                  children: [
                    Text(
                      "By pressing 'Submit,' you are legally agreeing to our terms and conditions.",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Gap(24.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: SingleChildScrollView(
                        child: Text(
                            "Acceptance of Terms: By accessing or using our mobile application (Nanny Now), you agree to be bound by these terms and conditions, our Privacy Policy, and any additional guidelines or rules posted on the App. Services Provided: The App provides a platform for users to connect with caregivers for childcare services. We do not employ or endorse any caregivers listed on the App and do not guarantee the quality, safety, or suitability of their services. User Accounts: To use certain features of the App, you may be required to create an account. You are responsible for maintaining the confidentiality of your account credentials and for any activity that occurs under your account. Booking and Payments: Users may book childcare services through the App by selecting a caregiver and specifying the date and time of service. Payment for services is processed through the App, and users agree to pay all fees and charges associated with their bookings. Cancellation and Refunds: Users may cancel bookings subject to our cancellation policy, which may vary depending on the caregiver's terms. Refunds may be provided in accordance with our refund policy. User Conduct: Users agree to use the App responsibly and lawfully and to respect the rights and privacy of other users and caregivers. Prohibited activities include but are not limited to harassment, discrimination, and fraudulent behavior. Intellectual Property: The App and its content, including text, graphics, logos, and software, are protected by intellectual property laws and may not be reproduced or distributed without our permission. Disclaimer of Warranties: We make no representations or warranties regarding the accuracy, reliability, or completeness of the information provided on the App or the quality of services provided by caregivers. The App is provided 'as is' and 'as available' without warranties of any kind. Limitation of Liability: In no event shall we be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with the use of the App or the services provided by caregivers. Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law principles. Changes to Terms: We reserve the right to modify or update these terms and conditions at any time without prior notice. It is your responsibility to review these terms periodically for changes."),
                      ),
                    ),
                    Gap(12.h),
                    Row(
                      children: [
                        Checkbox(
                          value: _acceptTermsAndConditions,
                          onChanged: (value) {
                            setState(() {
                              _acceptTermsAndConditions = value!;
                            });
                          },
                        ),
                        Text(
                          "Accept terms & conditions",
                          style: Theme.of(context).textTheme.bodyLarge!,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _acceptCamera,
                          onChanged: (value) {
                            setState(() {
                              _acceptCamera = value!;
                            });
                          },
                        ),
                        Text(
                          "Authorize use of external camera",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  if (state is RegistrationLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isNani ? '6 out of 6' : '5 out of 5',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text('Yay, finally done',
                                style: Theme.of(context).textTheme.labelSmall)
                          ],
                        ),
                        Gap(6.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                isNani ? 6 : 5,
                                (index) => Expanded(
                                      child: Container(
                                        margin: EdgeInsetsDirectional.only(
                                            end: AppSpaces.padding_4),
                                        height: AppSpaces.padding_8,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSpaces.padding_4),
                                            color: index < (isNani ? 6 : 5)
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                      ),
                                    ))),
                        Gap(6.h),
                        ElevatedButton(
                            onPressed: () {
                              if (!_acceptTermsAndConditions) {
                                MyApplication.showToastView(
                                    message:
                                        "Please accept terms and conditions");
                              } else if (!_acceptCamera) {
                                MyApplication.showToastView(
                                    message: "Please accept camera permission");
                              } else {
                                if (isNani) {
                                  context.read<RegistrationCubit>().nextPage();
                                } else {
                                  context
                                      .read<RegistrationCubit>()
                                      .registerParent();
                                }
                              }
                            },
                            child: const Text("Submit")),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

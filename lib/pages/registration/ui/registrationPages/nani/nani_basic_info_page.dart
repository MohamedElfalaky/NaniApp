import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/date_form_field.dart';

class NaniBasicInfoPage extends StatefulWidget {
  NaniBasicInfoPage({
    super.key,
  });

  @override
  State<NaniBasicInfoPage> createState() => _NaniBasicInfoPageState();
}

class _NaniBasicInfoPageState extends State<NaniBasicInfoPage>
    with AutomaticKeepAliveClientMixin<NaniBasicInfoPage> {
  final _registrationFormKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();
  final _nationalityController = TextEditingController();

  final _dateController = TextEditingController();

  final _mailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Info"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.padding_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Form(
                key: _registrationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Please make sure all your info is accurate & up-to-date.",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      Gap(24.h),

                      /// First Name Text Field
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _firstNameController,
                              decoration:
                                  const InputDecoration(hintText: 'First Name'),
                              validator: (value) => context
                                  .read<RegistrationCubit>()
                                  .validateNotEmptyField(
                                      value, 'First name can not be empty'),
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _lastNameController,
                              decoration:
                                  const InputDecoration(hintText: "Last Name"),
                              validator: (value) => context
                                  .read<RegistrationCubit>()
                                  .validateNotEmptyField(
                                      value, 'Last name can not be empty'),
                            ),
                          )
                        ],
                      ),

                      Gap(12.h),

                      DateTextField(
                        controller: _dateController,
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'Date can not be empty'),
                      ),

                      Gap(12.h),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _nationalityController,
                        decoration:
                            const InputDecoration(hintText: "Nationality"),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'Nationality can not be empty'),
                      ),
                      Gap(12.h),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _idController,
                        decoration: const InputDecoration(
                            hintText: "National ID / Passport"),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(value,
                                'National ID / Passport can not be empty'),
                      ),

                      Gap(12.h),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _mailController,
                        decoration:
                            const InputDecoration(hintText: "E-mail address"),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateEmail(value),
                      ),
                      Gap(12.h),

                      IntlPhoneField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _phoneController,
                        decoration: const InputDecoration(
                            hintText: 'Phone Number', counterText: ""),
                        initialCountryCode: 'EG',
                        onChanged: (phone) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1 out of 6',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Activities & Skills',
                    style: Theme.of(context).textTheme.labelSmall)
              ],
            ),
            Gap(6.h),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    6,
                    (index) => Expanded(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(
                                end: AppSpaces.padding_4),
                            height: AppSpaces.padding_8,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSpaces.padding_4),
                                color: index < 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary),
                          ),
                        ))),
            Gap(6.h),
            ElevatedButton(
                onPressed: () {
                  if (_registrationFormKey.currentState?.validate() ?? false) {
                    context.read<RegistrationCubit>().nextPage();
                    // goRouter.pushNamed(AppRoute.login.name);
                  }
                },
                child: const Text("Next")),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

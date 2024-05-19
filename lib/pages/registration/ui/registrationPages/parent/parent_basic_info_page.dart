import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/date_form_field.dart';

class ParentBasicInfoPage extends StatefulWidget {
  ParentBasicInfoPage({
    super.key,
  });

  @override
  State<ParentBasicInfoPage> createState() => _ParentBasicInfoPageState();
}

class _ParentBasicInfoPageState extends State<ParentBasicInfoPage>
    with AutomaticKeepAliveClientMixin<ParentBasicInfoPage> {
  String? _phoneNum;
  final _registrationFormKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _dateController = TextEditingController();

  final _mailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

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
                        "Please make sure all your infois accurate & up-to-date.",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      Gap(24.h),

                      /// First Name Text Field
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _firstNameController,
                        decoration:
                            const InputDecoration(hintText: 'First Name'),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'First name can not be empty'),
                      ),

                      Gap(12.h),

                      /// Last Name Text Field

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _lastNameController,
                        decoration:
                            const InputDecoration(hintText: "Last Name"),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'Last name can not be empty'),
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

                      /// Mail Text Field
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
                        onChanged: (phone) {
                          _phoneNum = phone.completeNumber;
                          print(_phoneNum);
                        },
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
                        controller: _passwordController,
                        decoration: const InputDecoration(hintText: "Password"),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'Password can not be empty'),
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
                  '1 out of 5',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Location & Address',
                    style: Theme.of(context).textTheme.labelSmall)
              ],
            ),
            Gap(6.h),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    5,
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
                    addDataToRegistrationModel();
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

  addDataToRegistrationModel() {
    context.read<RegistrationCubit>().parentRegistrationModel!.parent.fName =
        _firstNameController.text;
    context.read<RegistrationCubit>().parentRegistrationModel!.parent.lName =
        _lastNameController.text;
    context.read<RegistrationCubit>().parentRegistrationModel!.parent.dob =
        _dateController.text;
    context.read<RegistrationCubit>().parentRegistrationModel!.parent.email =
        _mailController.text;
    context
        .read<RegistrationCubit>()
        .parentRegistrationModel!
        .parent
        .phoneNumber = _phoneNum;

    context
        .read<RegistrationCubit>()
        .parentRegistrationModel!
        .parent
        .nidOrPassport = _idController.text;
    context.read<RegistrationCubit>().parentRegistrationModel!.parent.password =
        _passwordController.text;
  }

  @override
  bool get wantKeepAlive => true;
}

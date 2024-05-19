import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/custom_chips.dart';

class NaniWorkPrferancePage extends StatefulWidget {
  NaniWorkPrferancePage({
    super.key,
  });

  @override
  State<NaniWorkPrferancePage> createState() => _NaniWorkPrferancePageState();
}

class _NaniWorkPrferancePageState extends State<NaniWorkPrferancePage>
    with AutomaticKeepAliveClientMixin<NaniWorkPrferancePage> {
  final _registrationFormKey = GlobalKey<FormState>();

  final _districtController = TextEditingController();
  final _streetAdressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Preferences"),
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
            Expanded(
              child: Form(
                key: _registrationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Where do you live?",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(16.h),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _districtController,
                        decoration: const InputDecoration(
                            hintText: 'District ex. 5th settlement'),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'District can not be empty'),
                      ),
                      Gap(16.h),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _streetAdressController,
                        decoration:
                            const InputDecoration(hintText: 'Street address'),
                        validator: (value) => context
                            .read<RegistrationCubit>()
                            .validateNotEmptyField(
                                value, 'Street address can not be empty'),
                      ),
                      Gap(24.h),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Regular availability",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(16.h),
                      Wrap(
                          alignment: WrapAlignment.start,
                          children: context
                              .read<RegistrationCubit>()
                              .regularAvailability
                              .map(
                                (e) => CustomChips(
                                  value: e,
                                  addedList: context
                                      .read<RegistrationCubit>()
                                      .selectedregularAvailability,
                                ),
                              )
                              .toList()),
                      Gap(24.h),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Age group preference",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(16.h),
                      Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: context
                              .read<RegistrationCubit>()
                              .workingHours
                              .map(
                                (e) => SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: CustomChips(
                                    value: e,
                                    addedList: context
                                        .read<RegistrationCubit>()
                                        .selectedWorkingHours,
                                  ),
                                ),
                              )
                              .toList()),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 out of 6',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Documents',
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
                                color: index < 3
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary),
                          ),
                        ))),
            Gap(6.h),
            ElevatedButton(
                onPressed: () {
                  if (_registrationFormKey.currentState?.validate() ?? false) {
                    context.read<RegistrationCubit>().nextPage();
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

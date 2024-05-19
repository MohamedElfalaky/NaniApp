import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/custom_chips.dart';

class NaniActivitiesPage extends StatefulWidget {
  NaniActivitiesPage({
    super.key,
  });

  @override
  State<NaniActivitiesPage> createState() => _NaniActivitiesPageState();
}

class _NaniActivitiesPageState extends State<NaniActivitiesPage>
    with AutomaticKeepAliveClientMixin<NaniActivitiesPage> {
  final _registrationFormKey = GlobalKey<FormState>();

  final _naniBriefController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities & Skills"),
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
                          "Age group preference",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(16.h),
                      Wrap(
                          alignment: WrapAlignment.start,
                          children: context
                              .read<RegistrationCubit>()
                              .ageGroupPreference
                              .map(
                                (e) => CustomChips(
                                  value: e,
                                  addedList: context
                                      .read<RegistrationCubit>()
                                      .selectedAgeGroupPreference,
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
                          alignment: WrapAlignment.start,
                          children: context
                              .read<RegistrationCubit>()
                              .preferredActivities
                              .map(
                                (e) => CustomChips(
                                  value: e,
                                  addedList: context
                                      .read<RegistrationCubit>()
                                      .selectedPreferredActivities,
                                ),
                              )
                              .toList()),
                      Gap(24.h),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Additional notes",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(16.h),
                      TextFormField(
                        maxLines: 6,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _naniBriefController,
                        decoration: const InputDecoration(
                            hintText: 'a small brief about you...'),
                        // validator: (value) => context
                        //     .read<RegistrationCubit>()
                        //     .validateNotEmptyField(
                        //         value, 'District can not be empty'),
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
                  '2 out of 6',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Work Preferences',
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
                                color: index < 2
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

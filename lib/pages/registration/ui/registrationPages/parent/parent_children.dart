import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/myApplication.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/child_widget.dart';

class ParentChildren extends StatefulWidget {
  ParentChildren({
    super.key,
  });

  @override
  State<ParentChildren> createState() => _ParentChildrenState();
}

class _ParentChildrenState extends State<ParentChildren>
    with AutomaticKeepAliveClientMixin<ParentChildren> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Children"),
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
              child: SingleChildScrollView(
                child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Click to list a child, choose his/her preferred activities during visits!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<RegistrationCubit>().addChild();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge),
                              child: const Text("+ Add"),
                            ),
                          ],
                        ),
                        // Gap(24.sp),
                        Gap(16.h),

                        ...context.read<RegistrationCubit>().childrenList.map(
                              (e) => ChildWidget(model: e),
                            ),
                        Gap(12.h),
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 out of 5',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Payment & Billing',
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
                                color: index < 3
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.secondary),
                          ),
                        ))),
            Gap(6.h),
            ElevatedButton(
                onPressed: () {
                  if (context.read<RegistrationCubit>().childrenList.isEmpty) {
                    MyApplication.showToastView(message: "Please add children");
                  } else if (context
                          .read<RegistrationCubit>()
                          .childrenList
                          .any((element) => element.name!.isEmpty) ||
                      context
                          .read<RegistrationCubit>()
                          .childrenList
                          .any((element) => element.age!.isEmpty)) {
                    MyApplication.showToastView(
                        message: "Please complete children data");
                  } else {
                    context
                            .read<RegistrationCubit>()
                            .parentRegistrationModel!
                            .parent
                            .children =
                        context.read<RegistrationCubit>().childrenList;

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

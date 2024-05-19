import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

class NaniPaymentPage extends StatefulWidget {
  NaniPaymentPage({
    super.key,
  });

  @override
  State<NaniPaymentPage> createState() => _NaniPaymentPageState();
}

class _NaniPaymentPageState extends State<NaniPaymentPage>
    with AutomaticKeepAliveClientMixin<NaniPaymentPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment & Billing"),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Please provide a suitable medium or more to make the transactions",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Gap(24.h),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Image.asset(addCardIcon),
                          Gap(8.w),
                          Text(
                            "Bank account",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              hintText: "Account Holder's Name"),
                          validator: (value) => context
                              .read<RegistrationCubit>()
                              .validateNotEmptyField(value,
                                  "Account Holder's Name can not be empty"),
                        ),
                        Gap(16.h),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              counterText: "", hintText: 'Bank Name'),
                        ),
                        Gap(16.h),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              counterText: "", hintText: 'IBAN'),
                        ),
                        Gap(16.h)
                      ],
                    ),
                    Gap(16.h),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Image.asset(walletIcon),
                          Gap(8.w),
                          Text(
                            "Mobile wallet",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              hintText: "Wallet Owner’s Name"),
                          validator: (value) => context
                              .read<RegistrationCubit>()
                              .validateNotEmptyField(
                                  value, "Owner Name can not be empty"),
                        ),
                        Gap(16.h),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              counterText: "", hintText: 'Mobile Number'),
                        ),
                        Gap(16.h)
                      ],
                    ),
                    Gap(16.h),
                    ExpansionTile(
                      title: Row(
                        children: [
                          Image.asset(addCardIcon),
                          Gap(8.w),
                          Text(
                            "Instapay",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              hintText: "Account Holder's Name"),
                          validator: (value) => context
                              .read<RegistrationCubit>()
                              .validateNotEmptyField(value,
                                  "Account Holder's Name can not be empty"),
                        ),
                        Gap(16.h),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              counterText: "", hintText: 'Instapay handle'),
                        ),
                        Gap(16.h)
                      ],
                    ),
                    Gap(16.h),

                    // Container(
                    //   padding: EdgeInsets.all(AppSpaces.padding_24),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           width: 1,
                    //           color: Theme.of(context)
                    //               .colorScheme
                    //               .onSecondary
                    //               .withOpacity(0.12)),
                    //       borderRadius: BorderRadius.circular(8.r)),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Image.asset(addCardIcon),
                    //           Gap(8.w),
                    //           Text(
                    //             "Bank account",
                    //             style:
                    //                 Theme.of(context).textTheme.headlineMedium,
                    //           ),
                    //         ],
                    //       ),
                    //       Gap(24.h),
                    //       TextFormField(
                    //         autovalidateMode:
                    //             AutovalidateMode.onUserInteraction,
                    //         decoration: const InputDecoration(
                    //             hintText: "Account Holder's Name"),
                    //         validator: (value) => context
                    //             .read<RegistrationCubit>()
                    //             .validateNotEmptyField(value,
                    //                 "Account Holder's Name can not be empty"),
                    //       ),
                    //       Gap(16.h),
                    //       TextFormField(
                    //         autovalidateMode:
                    //             AutovalidateMode.onUserInteraction,
                    //         decoration: const InputDecoration(
                    //             counterText: "", hintText: 'Bank Name'),
                    //       ),
                    //       Gap(16.h),
                    //       TextFormField(
                    //         autovalidateMode:
                    //             AutovalidateMode.onUserInteraction,
                    //         decoration: const InputDecoration(
                    //             counterText: "", hintText: 'IBAN'),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5 out of 6',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Terms & Conditions',
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
                            margin: const EdgeInsetsDirectional.only(
                                end: AppSpaces.padding_4),
                            height: AppSpaces.padding_8,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSpaces.padding_4),
                                color: index < 5
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary),
                          ),
                        ))),
            Gap(6.h),
            ElevatedButton(
                onPressed: () {
                  context.read<RegistrationCubit>().nextPage();
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

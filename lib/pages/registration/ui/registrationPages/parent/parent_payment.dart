import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';
import 'package:parent_app/widgets/date_form_field.dart';

class ParentPayment extends StatefulWidget {
  ParentPayment({
    super.key,
  });

  @override
  State<ParentPayment> createState() => _ParentPaymentState();
}

class _ParentPaymentState extends State<ParentPayment>
    with AutomaticKeepAliveClientMixin<ParentPayment> {
  final _registrationFormKey = GlobalKey<FormState>();

  final _cardName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _expiryDate = TextEditingController();

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
              child: Form(
                key: _registrationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "Please add your card so you can make bookings!  ",
                            // style: TextStyle(fontSize: 12),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                        ),
                      ),
                      Gap(24.h),
                      Container(
                        padding: EdgeInsets.all(AppSpaces.padding_24),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(0.12)),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(addCardIcon),
                                Gap(8.w),
                                Text(
                                  "Add Card",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                            Gap(24.h),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _cardName,
                              decoration: const InputDecoration(
                                  hintText: "Account Holder's Name"),
                              validator: (value) => context
                                  .read<RegistrationCubit>()
                                  .validateNotEmptyField(value,
                                      "Account Holder's Name can not be empty"),
                            ),
                            Gap(16.h),
                            TextFormField(
                              maxLength: 16,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              controller: _cardNumber,
                              decoration: const InputDecoration(
                                  counterText: "", hintText: 'Card Number'),
                              validator: (value) => context
                                  .read<RegistrationCubit>()
                                  .validateCardNumber(
                                    value,
                                  ),
                            ),
                            Gap(16.h),
                            DateTextField(
                              isExpiryDateCard: true,
                              validator: (value) => context
                                  .read<RegistrationCubit>()
                                  .validateNotEmptyField(
                                      value, "Expiry Date can not be empty"),
                              controller: _expiryDate,
                            )
                          ],
                        ),
                      ),
                      Gap(12.h),
                      Text(
                          "Your card information is safe with us. Each time you proceed to payment, you'll enter your CVV for added security. Your bank will send an OTP to authenticate the transaction, ensuring your protection throughout the payment process.")
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4 out of 5',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Terms & Conditions',
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
                                color: index < 4
                                    ? Theme.of(context).primaryColor
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

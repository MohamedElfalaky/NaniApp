import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/data/models/parent_user_model/child.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/feature/settings/cache_services.dart';
import 'package:parent_app/pages/parent/home/cubit/parent_home_cubit.dart';
import 'package:parent_app/resources/colors/color_palette.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

import '../../../../feature/settings/myApplication.dart';

final class ParentHomeView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

final class _ParentHomeViewState extends State<ParentHomeView> {
  bool isChildrenSelected = false;
  late TextEditingController controller;

  @override
  initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final themeOF = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeOF.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Asmaa",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "36 Blue avenue, 1st settlement",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          actions: [
            SvgPicture.asset(giftIcon),
            const Gap(AppSpaces.padding_16)
          ],
        ),
        body: BlocBuilder<ParentHomeCubit, ParentHomeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.padding_16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        offerCard(themeOF),
                        offerCard(themeOF),
                        offerCard(themeOF),
                        offerCard(themeOF),
                      ],
                    ),
                  ),
                ),
                Gap(24.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.padding_16),
                  child: Text(
                    "Discover More",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Gap(16.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.padding_16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      discoverMore(context, moneyIcon, "Check Wallet"),
                      discoverMore(context, handIcon, "My Profile"),
                      discoverMore(context, clockIcon, "Past Visits"),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(AppSpaces.padding_16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: themeOF.colorScheme.onPrimary),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Looking for a nanny?",
                            style: themeOF.textTheme.headlineMedium,
                          ),
                          Text("-20% OFF",
                              style:
                                  TextStyle(color: themeOF.colorScheme.error)),
                        ],
                      ),
                      Gap(18.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            BlocBuilder<ParentHomeCubit, ParentHomeState>(
                              builder: (context, state) {
                                int additionalChildren = context
                                    .read<ParentHomeCubit>()
                                    .additionalChildren; // Initialize outside the InkWell scope

                                if (state is AdditionalChildrenChanged) {
                                  additionalChildren = state.additionalChildren;
                                }
                                return addButton(themeOF, additionalChildren);
                              },
                            ),
                            ...CacheServices.instance
                                .getParentModel()!
                                .parent!
                                .children!
                                .map(
                                  (e) => oneChild(themeOF, e,
                                      context.read<ParentHomeCubit>()),
                                )
                          ],
                        ),
                      ),
                      Gap(24.h),
                      SizedBox(
                          width: double.infinity,
                          child: BlocBuilder<ParentHomeCubit, ParentHomeState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () {
                                    final parentHomeCubit =
                                        context.read<ParentHomeCubit>();
                                    context.read<ParentHomeCubit>().getPrice();
                                    requestNow(context, themeOF,
                                        parentHomeCubit, controller);
                                  },
                                  child: const Text("Reqest Now"));
                            },
                          )),
                      Gap(16.h),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              requestLater(themeOF);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: themeOF.primaryColorDark,
                              backgroundColor: themeOF.primaryColorLight,
                            ),
                            child: const Text("Schedule Later"),
                          )),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }

  Future<dynamic> requestNow(
    BuildContext context,
    ThemeData themeOF,
    ParentHomeCubit parentHomeCubit,
    TextEditingController controller,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        final startTimeController = TextEditingController();
        final endTimeController = TextEditingController();
        return BlocProvider.value(
          value: BlocProvider.of<ParentHomeCubit>(context),
          child: BlocBuilder<ParentHomeCubit, ParentHomeState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                    top: AppSpaces.padding_16,
                    left: AppSpaces.padding_16,
                    right: AppSpaces.padding_16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Looking for a nanny?",
                            style: themeOF.textTheme.headlineMedium,
                          ),
                          InkWell(
                            onTap: () => AppRouter.goRouter.pop(),
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: themeOF.colorScheme.error)),
                          ),
                        ],
                      ),
                      Gap(24.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            addButton(
                                themeOF, parentHomeCubit.additionalChildren),
                            ...CacheServices.instance
                                .getParentModel()!
                                .parent!
                                .children!
                                .map(
                                  (e) => oneChild(themeOF, e, parentHomeCubit),
                                )
                          ],
                        ),
                      ),
                      Gap(24.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: parentHomeCubit.fromController,
                              readOnly: true,
                              decoration:
                                  const InputDecoration(hintText: "04:00 pm"),
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedTime != null) {
                                  int hour = pickedTime.hour;
                                  int minute = pickedTime.minute;
                                  String time = hour > 12 ? 'PM' : 'AM';
                                  hour = hour > 12 ? hour - 12 : hour;
                                  String hourStr =
                                      hour < 10 ? '0$hour' : '$hour';
                                  parentHomeCubit.fromController.text =
                                      '$hourStr:00 $time';
                                  DateTime now = DateTime.now();
                                  DateTime newTime = DateTime(now.year,
                                      now.month, now.day, hour, minute + 30);
                                  TimeOfDay endTime =
                                      TimeOfDay.fromDateTime(newTime);
                                  parentHomeCubit.fromController.text =
                                      endTime.format(context);
                                }
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSpaces.padding_8),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: parentHomeCubit.toController,
                              readOnly: true,
                              decoration:
                                  const InputDecoration(hintText: "07:00 pm"),
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      DateTime.now()
                                          .add(const Duration(minutes: 30))),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedTime != null) {
                                  int hour = pickedTime.hour;
                                  String time = hour > 12 ? 'PM' : 'AM';
                                  hour = hour > 12 ? hour - 12 : hour;
                                  String hourStr =
                                      hour < 10 ? '0$hour' : '$hour';
                                  parentHomeCubit.toController.text =
                                      '$hourStr:00 $time';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Gap(24.h),
                      Text(
                        "Visit Location",
                        style: themeOF.textTheme.headlineMedium,
                      ),
                      Gap(8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${CacheServices.instance.getParentModel()!.parent!.parentAddresses![0].district} ${CacheServices.instance.getParentModel()!.parent!.parentAddresses![0].remarkableLandmark} ",
                              style: themeOF.textTheme.bodyLarge!.copyWith(
                                  color: themeOF.colorScheme.secondary),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "Change",
                            style: themeOF.textTheme.bodyLarge!
                                .copyWith(color: themeOF.colorScheme.primary),
                          )
                        ],
                      ),
                      Gap(24.h),
                      Row(
                        children: [
                          Checkbox(
                            value: parentHomeCubit.check,
                            onChanged: (_) => parentHomeCubit.checkChildren(),
                          ),
                          Text("Authorize use of external camera",
                              style: themeOF.textTheme.bodyLarge)
                        ],
                      ),
                      const Divider(),
                      Gap(24.h),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Have a promocode?",
                            suffixIcon: SizedBox(
                              // height: 5,
                              width: 15,
                              child: Center(
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                    color: themeOF.primaryColor,
                                  ),

                                  // style: themeOF.textTheme.headlineSmall,
                                ),
                              ),
                            )),
                      ),
                      Gap(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: TextStyle(color: themeOF.colorScheme.error),
                          ),
                          Text("-80 EGP",
                              style:
                                  TextStyle(color: themeOF.colorScheme.error))
                        ],
                      ),
                      Gap(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total amount ",
                          ),
                          Text("${parentHomeCubit.totalPrice} EGP",
                              style: themeOF.textTheme.headlineMedium)
                        ],
                      ),
                      Gap(24.h),
                      if (state is RequestNaniLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ElevatedButton(
                          onPressed: () {
                            if (parentHomeCubit.check) {
                              parentHomeCubit.requestNani();
                              if (state is RequestNaniSuccess) {
                                paymentCard(context, themeOF);
                              }
                            } else {
                              MyApplication.showToastView(
                                  message: "Please authorize the camera");
                            }
                          },
                          child: const Text("Place Request")),
                      Gap(12.h),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<dynamic> paymentCard(BuildContext context, ThemeData themeOF) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select payment"),
              InkWell(
                  onTap: () => AppRouter.goRouter.pop(),
                  child: const Icon(Icons.close))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(visaIcon),
                  Gap(4.w),
                  const Text("***** 1234"),
                  const Spacer(),
                  Radio(
                    value: "value",
                    groupValue: "groupValue",
                    onChanged: (value) {},
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(mastercardIcon),
                  Gap(4.w),
                  const Text("***** 1234"),
                  const Spacer(),
                  Radio(
                    value: "value",
                    groupValue: "groupValue",
                    onChanged: (value) {},
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  AppRouter.goRouter.pop();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: themeOF.primaryColorDark,
                  backgroundColor: themeOF.primaryColorLight,
                ),
                child: const Text("+ Add another card"),
              ),
              Gap(8.h),
              ElevatedButton(
                  onPressed: () {
                    AppRouter.goRouter.pushNamed(AppRoute.sendingrequest.name);
                  },
                  child: const Text("Pay 740 EGP"))
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> requestLater(ThemeData themeOF) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: AppSpaces.padding_16,
              left: AppSpaces.padding_16,
              right: AppSpaces.padding_16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Schedule a visit",
                      style: themeOF.textTheme.headlineMedium,
                    ),
                    InkWell(
                      onTap: () => AppRouter.goRouter.pop(),
                      child: Text("Cancel",
                          style: TextStyle(color: themeOF.colorScheme.error)),
                    ),
                  ],
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      2,
                      (ind) => Expanded(
                            child: Container(
                              margin: ind == 0
                                  ? const EdgeInsetsDirectional.only(end: 4)
                                  : null,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: ind == 0
                                      ? themeOF.primaryColor
                                      : themeOF.colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          )),
                ),
                Gap(24.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BlocBuilder<ParentHomeCubit, ParentHomeState>(
                        builder: (context, state) {
                          int additionalChildren = context
                              .read<ParentHomeCubit>()
                              .additionalChildren;

                          if (state is AdditionalChildrenChanged) {
                            additionalChildren = state.additionalChildren;
                          }
                          return addButton(themeOF, additionalChildren);
                        },
                      ),
                      ...CacheServices.instance
                          .getParentModel()!
                          .parent!
                          .children!
                          .map(
                            (e) => oneChild(
                                themeOF, e, context.read<ParentHomeCubit>()),
                          )
                    ],
                  ),
                ),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dateCard("04 Mar", "Today", themeOF),
                    dateCard("05 Mar", "Tomorrow", themeOF),
                    dateCard("08 Mar", "Weekend", themeOF),
                  ],
                ),
                Gap(24.h),
                const Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(hintText: "04:00 pm"),
                    )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSpaces.padding_8),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(hintText: "07:00 pm"),
                    )),
                  ],
                ),
                Gap(24.h),
                const Divider(),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total amount ",
                    ),
                    Text("820 EGP", style: themeOF.textTheme.headlineMedium)
                  ],
                ),
                Gap(12.h),
                ElevatedButton(
                    onPressed: () {
                      requestLaterSecondPage(themeOF);
                    },
                    child: const Text("Checkout")),
                Gap(12.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> requestLaterSecondPage(ThemeData themeOF) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: AppSpaces.padding_16,
              left: AppSpaces.padding_16,
              right: AppSpaces.padding_16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(12.h),
                Row(
                  children: [
                    InkWell(
                        onTap: () => AppRouter.goRouter.pop(),
                        child: const Icon(Icons.arrow_back_ios)),
                    Text(
                      "05 Mar, 3h Visit...",
                      style: themeOF.textTheme.headlineMedium,
                    ),
                  ],
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      2,
                      (ind) => Expanded(
                            child: Container(
                              margin: ind == 0
                                  ? const EdgeInsetsDirectional.only(end: 4)
                                  : null,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: ind == 1
                                      ? themeOF.primaryColor
                                      : themeOF.colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          )),
                ),
                Gap(24.h),
                Text(
                  "Visit Location",
                  style: themeOF.textTheme.headlineMedium,
                ),
                Gap(8.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "36 Blue avenue, 1st settlement, New Cairo ",
                        style: themeOF.textTheme.bodyLarge!
                            .copyWith(color: themeOF.colorScheme.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Change",
                      style: themeOF.textTheme.bodyLarge!
                          .copyWith(color: themeOF.colorScheme.primary),
                    )
                  ],
                ),
                Gap(24.h),
                Text(
                  "Additional notes",
                  style: themeOF.textTheme.headlineMedium,
                ),
                Gap(8.h),
                const TextField(
                  maxLines: 6,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text("Authorize use of external camera",
                        style: themeOF.textTheme.bodyLarge)
                  ],
                ),
                const Divider(),
                Gap(8.h),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Have a promocode?",
                      suffixIcon: SizedBox(
                        // height: 5,
                        width: 15,
                        child: Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              color: themeOF.primaryColor,
                            ),

                            // style: themeOF.textTheme.headlineSmall,
                          ),
                        ),
                      )),
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(color: themeOF.colorScheme.error),
                    ),
                    Text("-80 EGP",
                        style: TextStyle(color: themeOF.colorScheme.error))
                  ],
                ),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total amount ",
                    ),
                    Text("740 EGP", style: themeOF.textTheme.headlineMedium)
                  ],
                ),
                Gap(12.h),
                ElevatedButton(
                    onPressed: () {
                      paymentCard(context, themeOF);
                    },
                    child: const Text("Place Request")),
                Gap(12.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget addButton(ThemeData themeOF, int additionalChildren) {
    return InkWell(
      onTap: () {
        final parentHomeCubit = context.read<ParentHomeCubit>();
        showDialog(
          context: context,
          builder: (ctx) {
            return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Add children"),
                    InkWell(
                        onTap: () => AppRouter.goRouter.pop(),
                        child: const Icon(Icons.close))
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Please note! adding more children will increase the fees of the visit!",
                      style: themeOF.textTheme.bodyLarge!
                          .copyWith(color: themeOF.colorScheme.secondary),
                    ),
                    Gap(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            parentHomeCubit.removeAdditionalChildren();
                            setState(() {
                              if (parentHomeCubit.state
                                  is AdditionalChildrenChanged) {
                                additionalChildren = (parentHomeCubit.state
                                        as AdditionalChildrenChanged)
                                    .additionalChildren;
                              }
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeOF.primaryColorLight,
                              ),
                              child: Icon(Icons.remove,
                                  color: themeOF.primaryColorDark)

                              //  Text(
                              //   "-",
                              //   style: TextStyle(
                              //       color: themeOF.primaryColorDark,
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold),
                              //   textAlign: TextAlign.center,
                              // ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpaces.padding_16),
                          child: Text(
                            additionalChildren.toString(),
                            style: themeOF.textTheme.headlineLarge!
                                .copyWith(color: ColorPalette.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            parentHomeCubit.addAdditionalChildren();
                            setState(() {
                              if (parentHomeCubit.state
                                  is AdditionalChildrenChanged) {
                                additionalChildren = (parentHomeCubit.state
                                        as AdditionalChildrenChanged)
                                    .additionalChildren;
                              }
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeOF.primaryColor,
                              ),
                              child: Icon(Icons.add,
                                  color: themeOF.primaryColorLight)

                              //  Text(
                              //   "+",
                              //   style: TextStyle(
                              //       color: themeOF.primaryColorLight,
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold),
                              //   textAlign: TextAlign.center,
                              // ),
                              ),
                        )
                      ],
                    ),
                    Gap(30.h),
                    ElevatedButton(
                        onPressed: () {
                          parentHomeCubit.getPrice();
                          AppRouter.goRouter.pop();
                        },
                        child: const Text("Done"))
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                // color: themeOF.primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: themeOF.primaryColor,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 25.sp,
                backgroundColor: themeOF.colorScheme.onPrimary,
                child: Text(
                  context.read<ParentHomeCubit>().additionalChildren == 0
                      ? "+"
                      : context
                          .read<ParentHomeCubit>()
                          .additionalChildren
                          .toString(),
                  style:
                      TextStyle(color: themeOF.primaryColor, fontSize: 20.sp),
                ),
              ),
            ),
            Gap(4.h),
            Text(
              "Add",
              style: themeOF.textTheme.headlineSmall!
                  .copyWith(color: themeOF.primaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget oneChild(
      ThemeData themeOF, Child child, ParentHomeCubit parentHomeCubit) {
    return GestureDetector(
      onTap: () {
        context.read<ParentHomeCubit>().addChildren(child.id!);
        parentHomeCubit.getPrice();
        setState(() {});
        debugPrint(context.read<ParentHomeCubit>().selectedChildren.toString());
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: AppSpaces.padding_16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: !parentHomeCubit.selectedChildren.contains(child.id!)
                    ? Colors.grey[500]
                    : themeOF.primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: !parentHomeCubit.selectedChildren.contains(child.id!)
                      ? Colors.grey[500]!
                      : themeOF.primaryColorLight,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 25.sp,
                backgroundColor:
                    !parentHomeCubit.selectedChildren.contains(child.id!)
                        ? Colors.grey[500]
                        : themeOF.primaryColorLight,
                child: Image.asset(
                  child.gender == 'male' ? boyIcon : girlIconPng,
                  height: 30.sp,
                  width: 30.sp,
                ),
              ),
            ),
            Gap(4.h),
            Text(
              child.name ?? "",
              style: themeOF.textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }

  Container discoverMore(BuildContext context, String logo, String text) {
    return Container(
      height: 100.sp,
      width: 100.sp,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.padding_16, vertical: AppSpaces.padding_16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            logo,
            height: 22,
            width: 22,
          ),
          // Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.start,
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ],
      ),
    );
  }

  Container dateCard(String date, String text, ThemeData themeOF) {
    return Container(
      height: 100.sp,
      width: 100.sp,
      padding: const EdgeInsets.all(AppSpaces.padding_8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: themeOF.primaryColorLight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: themeOF.textTheme.headlineMedium!
                .copyWith(color: themeOF.primaryColorDark),
          ),
          Text(
            text,
            style: themeOF.textTheme.headlineSmall!
                .copyWith(color: themeOF.primaryColorDark),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container offerCard(ThemeData themeOF) {
    return Container(
      width: 300.w,
      padding: const EdgeInsets.all(AppSpaces.padding_16),
      margin: const EdgeInsets.all(AppSpaces.padding_4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorPalette.appYellow),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weekend Offer!",
                  style: themeOF.textTheme.headlineMedium!
                      .copyWith(fontFamily: 'Montserrat'),
                ),
                const Gap(AppSpaces.padding_8),
                Text(
                  "On weekends, enjoy 20% off when requesting a visit!",
                  style: themeOF.textTheme.headlineSmall,
                )
              ],
            ),
          ),
          Expanded(flex: 1, child: Image.asset(offerIcon)
              //  SvgPicture.asset(offerIcon)

              )
        ],
      ),
    );
  }
}

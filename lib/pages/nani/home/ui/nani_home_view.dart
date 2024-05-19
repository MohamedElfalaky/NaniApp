import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

final class NaniHomeView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NaniHomeView({super.key});

  @override
  State<NaniHomeView> createState() => _NaniHomeViewState();
}

final class _NaniHomeViewState extends State<NaniHomeView> {
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
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSpaces.padding_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(AppSpaces.padding_16),
                decoration: BoxDecoration(
                  color: themeOF.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You are available for work 🎉",
                            style: themeOF.textTheme.bodyLarge),
                        Gap(4),
                        Text("You can toggle this button off anytime..",
                            style: themeOF.textTheme.labelSmall),
                      ],
                    ),
                    Spacer(),
                    Switch(value: true, onChanged: (v) {})
                  ],
                ),
              ),
              Gap(24.h),
              Text(
                "Discover More",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  discoverMore(context, moneyIcon, "Check Wallet"),
                  discoverMore(context, handIcon, "My Profile"),
                  discoverMore(context, clockIcon, "Past Visits"),
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You have (3) requests",
                    style: themeOF.textTheme.headlineMedium,
                  ),
                  Text("view all",
                      style: themeOF.textTheme.headlineMedium!.copyWith(
                          color: themeOF.colorScheme.primary,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Gap(16.h),
              naniRequest(context, themeOF, themeOF.colorScheme.onTertiary,
                  themeOF.colorScheme.onPrimary),
              naniRequest(context, themeOF, themeOF.colorScheme.onPrimary,
                  themeOF.colorScheme.onSecondary),
              InkWell(
                  onTap: () => commingRequest(themeOF),
                  child: naniRequest(
                      context,
                      themeOF,
                      themeOF.colorScheme.onPrimary,
                      themeOF.colorScheme.onSecondary)),
            ],
          ),
        ));
  }

  Container naniRequest(
      BuildContext context, ThemeData themeOF, color, textColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(AppSpaces.padding_16),
      margin: EdgeInsetsDirectional.only(bottom: AppSpaces.padding_8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text("5th settlement, New Cairo",
              style: themeOF.textTheme.bodyLarge!.copyWith(color: textColor)),
          Spacer(),
          Text(
            "09:00 AM",
            style: themeOF.textTheme.bodyLarge!.copyWith(color: textColor),
          )
        ],
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

  Future<dynamic> commingRequest(ThemeData themeOF) {
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
                Center(
                  child: Text(
                    "+450 EGP",
                    style: themeOF.textTheme.headlineLarge,
                  ),
                ),
                Gap(8.h),
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                      color: themeOF.colorScheme.onTertiary,
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                Gap(24.h),
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpaces.padding_4),
                      margin: EdgeInsetsDirectional.only(
                          end: AppSpaces.padding_8,
                          bottom: AppSpaces.padding_4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text("Now",
                          style: themeOF.textTheme.labelSmall!
                              .copyWith(color: themeOF.colorScheme.onPrimary)),
                    ),
                    Container(
                      padding: EdgeInsets.all(AppSpaces.padding_4),
                      margin: EdgeInsetsDirectional.only(
                          end: AppSpaces.padding_8,
                          bottom: AppSpaces.padding_4),
                      decoration: BoxDecoration(
                        color: themeOF.primaryColorDark,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text("Recommended",
                          style: themeOF.textTheme.labelSmall!
                              .copyWith(color: themeOF.colorScheme.onPrimary)),
                    ),
                  ],
                ),
                Gap(8.h),
                Text("Today, 04 March",
                    style: themeOF.textTheme.headlineMedium),
                Gap(4.h),
                Row(
                  children: [
                    Text(
                      "09:00",
                      style: themeOF.textTheme.bodyLarge,
                    ),
                    Gap(4),
                    Text(
                      "PM",
                      style: themeOF.textTheme.labelSmall,
                    ),
                    Gap(8),
                    Icon(Icons.arrow_forward),
                    Gap(8),
                    Text(
                      "09:00",
                      style: themeOF.textTheme.bodyLarge,
                    ),
                    Gap(4),
                    Text(
                      "PM",
                      style: themeOF.textTheme.labelSmall,
                    ),
                    Gap(12),
                  ],
                ),
                Gap(4.h),
                Text(
                  "👦🏻 3 children",
                  style: themeOF.textTheme.bodyLarge,
                ),
                Gap(4.h),
                Text(
                  "📌 5th settlement, New Cairo",
                  style: themeOF.textTheme.bodyLarge,
                ),
                Gap(4.h),
                Text(
                  "👁️ Camera authorized",
                  style: themeOF.textTheme.bodyLarge,
                ),
                Gap(8.h),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              AppRouter.goRouter
                                  .pushNamed(AppRoute.nanisendrequest.name);
                            },
                            child: Text("Accept"))),
                    Gap(8),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeOF.colorScheme.tertiary,
                                foregroundColor: themeOF.colorScheme.error),
                            onPressed: () {
                              AppRouter.goRouter.pop();
                            },
                            child: Text("Cancel")))
                  ],
                ),
                Gap(12.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

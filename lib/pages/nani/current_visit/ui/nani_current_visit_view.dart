import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';

final class NaniCurrentVisitView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NaniCurrentVisitView({super.key});

  @override
  State<NaniCurrentVisitView> createState() => _NaniCurrentVisitViewState();
}

final class _NaniCurrentVisitViewState extends State<NaniCurrentVisitView> {
  @override
  Widget build(BuildContext context) {
    int modifier = 1;

    final themeOF = Theme.of(context);

    return Scaffold(
        backgroundColor: Color(0xffF2F3F7),
        appBar: AppBar(
          backgroundColor: Color(0xffF2F3F7),
          title: Text(
            "Active Request",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSpaces.padding_16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (modifier == 0)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(AppSpaces.padding_8),
                    decoration: BoxDecoration(
                      color: themeOF.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.not_listed_location_outlined,
                            color: themeOF.colorScheme.onPrimary),
                        Gap(8),
                        Text("Visit is starting in 29 min ...",
                            style: themeOF.textTheme.bodyLarge!.copyWith(
                                color: themeOF.colorScheme.onPrimary)),
                      ],
                    ),
                  ),
                Gap(8.h),
                if (modifier == 1) ...[
                  Gap(8.h),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CircularCountDownTimer(
                      duration: 10,
                      initialDuration: 6,
                      controller: CountDownController(),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      ringColor: Colors.white,
                      ringGradient: null,
                      fillColor: themeOF.primaryColor,
                      fillGradient: null,
                      // backgroundColor: themeOF.primaryColor,
                      backgroundGradient: null,
                      strokeWidth: 10.0,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                          fontSize: 33.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      //  textFormat: CountdownTextFormat.S,
                      isReverse: false,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: false,
                      onStart: () {
                        debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        debugPrint('Countdown Ended');
                      },
                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
                      timeFormatterFunction:
                          (defaultFormatterFunction, duration) {
                        if (duration.inSeconds == 0) {
                          return "";
                        } else {
                          return Function.apply(
                              defaultFormatterFunction, [duration]);
                        }
                      },
                    ),
                  ),
                  Gap(30.h),
                ],
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
                          Text("Asmaa Ahmed",
                              style: themeOF.textTheme.headlineMedium),
                          Gap(4),
                          Text("is expecting you ..",
                              style: themeOF.textTheme.labelSmall!.copyWith(
                                  color: themeOF.colorScheme.primary)),
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: themeOF.primaryColorLight,
                        child: Icon(
                          Icons.phone,
                          color: themeOF.primaryColorDark,
                        ),
                      ),
                      Gap(4),
                      CircleAvatar(
                        backgroundColor: themeOF.primaryColorLight,
                        child: Icon(
                          Icons.directions,
                          color: themeOF.primaryColorDark,
                        ),
                      )
                    ],
                  ),
                ),
                Gap(16.h),
                if (modifier == 1) ...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(AppSpaces.padding_8),
                    decoration: BoxDecoration(
                      color: Color(0xffC0FFD7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_outlined,
                            color: themeOF.colorScheme.onTertiary),
                        Gap(8),
                        Text("Link sent to parent",
                            style: themeOF.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Gap(AppSpaces.padding_16.h),
                ],
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(AppSpaces.padding_16),
                    decoration: BoxDecoration(
                      color: themeOF.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Today, 04 March",
                                style: themeOF.textTheme.headlineMedium),
                            Text("450 EGP",
                                style: themeOF.textTheme.headlineMedium!
                                    .copyWith(color: themeOF.primaryColor)),
                          ],
                        ),
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
                              "12:00",
                              style: themeOF.textTheme.bodyLarge,
                            ),
                            Gap(4),
                            Text(
                              "AM",
                              style: themeOF.textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Gap(12),
                        Text(
                          "5th settlement",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                        Text(
                          "Mostafa Hegazy st, 14 avenue, district 4t",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                        Text(
                          "Villa 106",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                        Text(
                          "Apartment 17",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                        Text(
                          "Landmark: Total gas station",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                      ],
                    )),
                Gap(16.h),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(AppSpaces.padding_16),
                    decoration: BoxDecoration(
                      color: themeOF.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meet your visit companions",
                            style: themeOF.textTheme.headlineMedium),
                        Gap(12),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Container(
                              padding: EdgeInsets.all(AppSpaces.padding_8),
                              margin: EdgeInsetsDirectional.only(
                                  end: AppSpaces.padding_8,
                                  bottom: AppSpaces.padding_4),
                              decoration: BoxDecoration(
                                border: Border.all(color: themeOF.primaryColor),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(" 👧🏼 Lay, 3 yrs",
                                  style: themeOF.textTheme.headlineSmall),
                            ),
                          ),
                        ),
                        Gap(12),
                        Text(
                          "Note from parent .. ",
                          style: themeOF.textTheme.bodyLarge!
                              .copyWith(color: themeOF.colorScheme.secondary),
                        ),
                        Text(
                          "Please keep an eye on Yehia as his favorite thing is making trouble ..",
                          style: themeOF.textTheme.bodyLarge!,
                        ),
                      ],
                    )),
                Gap(24.h),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        modifier == 0 ? "450 EGP - Start Visit" : "End Visit")),
                TextButton(
                  onPressed: () {
                    cancelVisit(context, themeOF);
                  },
                  child: Text(modifier == 0 ? "Cancel Visit" : "Report Issue"),
                  style: TextButton.styleFrom(
                      foregroundColor: themeOF.colorScheme.error),
                )
              ],
            ),
          ),
        ));
  }

  Container naniRequest(BuildContext context, ThemeData themeOF, color) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(AppSpaces.padding_16),
      margin: EdgeInsetsDirectional.only(
          end: AppSpaces.padding_16, bottom: AppSpaces.padding_8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text("5th settlement, New Cairo", style: themeOF.textTheme.bodyLarge),
          Spacer(),
          Text("09:00 AM", style: themeOF.textTheme.bodyLarge),
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

  Future<dynamic> cancelVisit(BuildContext context, ThemeData themeOF) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cancel visit?"),
              InkWell(
                  onTap: () => AppRouter.goRouter.pop(),
                  child: Icon(Icons.close))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sure you want to cancel your visit? ",
                style: themeOF.textTheme.bodyLarge!
                    .copyWith(color: themeOF.colorScheme.secondary),
              ),
              Gap(30.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeOF.colorScheme.tertiary,
                      foregroundColor: themeOF.colorScheme.error),
                  onPressed: () {
                    AppRouter.goRouter.pop();
                  },
                  child: Text("Cancel"))
            ],
          ),
        );
      },
    );
  }
}

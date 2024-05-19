import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

final class SendingRequestView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SendingRequestView({super.key});

  @override
  State<SendingRequestView> createState() => _SendingRequestViewState();
}

final class _SendingRequestViewState extends State<SendingRequestView> {
  @override
  Widget build(BuildContext context) {
    var themeOF = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeOF.scaffoldBackgroundColor,
          title: Text(
            "Sending Request..",
            // style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            InkWell(
              onTap: () => cancelRequest(context, themeOF),
              child: Text("Cancel",
                  style: TextStyle(color: themeOF.colorScheme.error)),
            ),
            Gap(AppSpaces.padding_16)
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              // child: Lottie.asset(naniJson)
              // Image.asset(
              //   nani2,
              //   fit: BoxFit.cover,
              // )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.all(AppSpaces.padding_24),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: themeOF.colorScheme.onPrimary,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(22.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Looking for a nanny nearby ..",
                            style: themeOF.textTheme.headlineMedium,
                          ),
                          Text("09:59",
                              style: TextStyle(
                                  color: themeOF.colorScheme.onTertiary)),
                        ],
                      ),
                      Gap(18.h),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                            color: themeOF.colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      Gap(24.h),
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
                      Gap(18.h),
                      Row(
                        children: [
                          Image.asset(
                            boyIcon,
                            height: 18,
                            width: 18,
                          ),
                          Text(
                            " 3 children",
                            style: themeOF.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Gap(4.h),
                      Row(
                        children: [
                          Image.asset(
                            pinIcon,
                            height: 18,
                            width: 18,
                          ),
                          Text(
                            " 5th settlement, New Cairo",
                            style: themeOF.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Gap(4.h),
                      Row(
                        children: [
                          Image.asset(
                            eyeIcon,
                            height: 18,
                            width: 18,
                          ),
                          InkWell(
                            onTap: () => AppRouter.goRouter
                                .pushNamed(AppRoute.requestdone.name),
                            child: Text(
                              " Camera authorized",
                              style: themeOF.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Future<dynamic> cancelRequest(BuildContext context, ThemeData themeOF) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cancel request?"),
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
                "Sure you want to cancel your request? all info will be lost!",
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

final class NaniSendingRequestView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NaniSendingRequestView({super.key});

  @override
  State<NaniSendingRequestView> createState() => _NaniSendingRequestViewState();
}

final class _NaniSendingRequestViewState extends State<NaniSendingRequestView> {
  @override
  Widget build(BuildContext context) {
    var themeOF = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeOF.scaffoldBackgroundColor,
          title: Text(
            "Accepted! 🎉",
            // style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                  height: MediaQuery.of(context).size.height * 0.47,
                  decoration: BoxDecoration(
                      color: themeOF.colorScheme.onPrimary,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(22.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          Gap(12),
                        ],
                      ),
                      Divider(
                        color: const Color.fromARGB(103, 0, 0, 0),
                      ),
                      Gap(12),
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
                      InkWell(
                        onTap: () => AppRouter.goRouter
                            .pushNamed(AppRoute.requestdone.name),
                        child: Text(
                          "👁️ Camera authorized",
                          style: themeOF.textTheme.bodyLarge,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            AppRouter.goRouter
                                .pushNamed(AppRoute.nanicurrentvisit.name);
                          },
                          child: Text("View Visit Page")),
                      Gap(8.h),
                      ElevatedButton(
                        onPressed: () {
                          AppRouter.goRouter.pushNamed(AppRoute.nanihome.name);
                        },
                        child: Text("Home Page"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: themeOF.primaryColorDark,
                          backgroundColor: themeOF.primaryColorLight,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

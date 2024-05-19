import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

final class RequestDoneView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RequestDoneView({super.key});

  @override
  State<RequestDoneView> createState() => _RequestDoneViewState();
}

final class _RequestDoneViewState extends State<RequestDoneView> {
  @override
  Widget build(BuildContext context) {
    var themeOF = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeOF.scaffoldBackgroundColor,
          title: Text(
            "Bingo! 🎉 Nanny on the way",
            // style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
                  height: MediaQuery.of(context).size.height * 0.6,
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
                          Text(
                            "Today, 04 March",
                            style: themeOF.textTheme.headlineMedium,
                          ),
                          Text("740 EGP",
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
                      Gap(24.h),
                      Divider(),
                      Gap(16.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              // color: themeOF.primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: themeOF.primaryColor,
                                width: 1.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 25.sp,
                              backgroundColor: themeOF.primaryColorLight,
                              backgroundImage: AssetImage(naniGirl),
                              // child: Image.asset(
                              //   naniGirl,
                              //   fit: BoxFit.fitHeight,
                              // ),
                            ),
                          ),
                          Gap(6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Yasmine Zyad",
                                  style: themeOF.textTheme.headlineMedium),
                              Text("arriving in 3h 19min",
                                  style: themeOF.textTheme.labelSmall!
                                      .copyWith(color: themeOF.primaryColor)),
                            ],
                          ),
                          Spacer(),
                          Image.asset(star),
                          Gap(4),
                          Text("4.8", style: themeOF.textTheme.headlineMedium)
                        ],
                      ),
                      Gap(14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              4,
                              (index) => Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    padding:
                                        EdgeInsets.all(AppSpaces.padding_16),
                                    margin: EdgeInsetsDirectional.only(
                                        end: AppSpaces.padding_16,
                                        start: 2,
                                        top: 2,
                                        bottom: 2),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0xff000000)
                                                .withOpacity(0.07))
                                      ],
                                      color: themeOF.colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Hadya Shreef",
                                            style: themeOF
                                                .textTheme.headlineSmall),
                                        Gap(4),
                                        Text(
                                            "Yasmina was wonderful with the kids, they really enjoyed the visit and had fun 😍 ",
                                            style:
                                                themeOF.textTheme.labelSmall),
                                      ],
                                    ),
                                  )),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            AppRouter.goRouter
                                .pushNamed(AppRoute.sendingrequest.name);
                          },
                          child: Text("View Visit Page")),
                      Gap(8.h),
                      ElevatedButton(
                        onPressed: () {
                          AppRouter.goRouter
                              .pushNamed(AppRoute.parenthome.name);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/styles/Icons.dart';

final class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  PageController controller = PageController();
  List onboardingPages = [
    {
      'image': onboarding1,
      'title': 'Welcome Aboard!',
      'contents':
          "We're here to make finding childcare services simple and stress-free. we've got you covered. Let's find the perfect caregiver for your family!"
    },
    {
      'image': onboarding2,
      'title': 'Discover Trusted Caregivers',
      'contents':
          "Explore our network of vetted caregivers. Read reviews, and find the perfect match for your family's needs. Scheduling childcare has never been easier!"
    },
    {
      'image': onboarding3,
      'title': 'Book with Confidence',
      'contents':
          "Choose your date, time, and leave the rest to us. Our transparent pricing and dedicated support team ensure a hassle-free experience. Let's get started!"
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeOf = Theme.of(context);
    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: PageView.builder(
            controller: controller,
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    onboardingPages[index]['image'],
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Optional: You can adjust the stops to control the flow of the gradient
                          stops: [0.0, 0.5],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: size.height * 0.34,
                      width: size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            onboardingPages[index]['title'],
                            style: themeOf.textTheme.headlineLarge!
                                .copyWith(fontSize: 18.sp),
                          ),
                          Gap(8.h),
                          Text(
                            onboardingPages[index]['contents'],
                            style: themeOf.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (indexx) => Container(
                                      margin:
                                          EdgeInsetsDirectional.only(end: 4),
                                      height: 7,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: index == indexx
                                              ? themeOf.primaryColor
                                              : themeOf.colorScheme.tertiary),
                                    )),
                          ),
                          Spacer(),
                          index != 2
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          AppRouter.goRouter
                                              .goNamed(AppRoute.login.name);
                                        },
                                        child: Text(
                                          "Skip",
                                          style: themeOf.textTheme.bodyLarge,
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeIn);
                                        },
                                        child: Text("Next",
                                            style:
                                                themeOf.textTheme.bodyLarge)),
                                  ],
                                )
                              : TextButton(
                                  onPressed: () {
                                    AppRouter.goRouter
                                        .goNamed(AppRoute.login.name);
                                  },
                                  child: Text(
                                    "Start booking hassle-free visits!",
                                    style: themeOf.textTheme.bodyLarge,
                                  )),
                          Gap(24.h)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

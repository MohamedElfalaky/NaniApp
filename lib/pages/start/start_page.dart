import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';
import 'package:parent_app/util/globals.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(startIcon),
                  Gap(24.h),
                  Text(
                    "Nanny Now",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.all(AppSpaces.padding_16),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(18.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome to Nanny Now",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "Demo v1.0.0",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                  Gap(24.h),
                  ElevatedButton(
                      onPressed: () {
                        isNani = false;
                        // AppRouter.goRouter
                        // .pushNamed(AppRoute.registration.name);
                        AppRouter.goRouter.pushNamed(AppRoute.parenthome.name);
                        // AppRouter.goRouter.pushNamed(AppRoute.login.name);
                      },
                      child: Text("Parent Register")
                      // Text("Complete as parent")

                      ),
                  Gap(8.h),
                  ElevatedButton(
                    onPressed: () {
                      isNani = true;
                      // AppRouter.goRouter.pushNamed(AppRoute.registration.name);
                      AppRouter.goRouter.pushNamed(AppRoute.nanihome.name);
                      // AppRouter.goRouter.pushNamed(AppRoute.login.name);
                    },
                    child: Text("Nanny Register"),
                    // child: Text("Complete as Nanny"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        foregroundColor: Theme.of(context).primaryColorDark),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

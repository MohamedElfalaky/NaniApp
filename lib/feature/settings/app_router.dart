import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parent_app/pages/login/ui/login_page.dart';
import 'package:parent_app/pages/nani/current_visit/ui/nani_current_visit_page.dart';
import 'package:parent_app/pages/nani/home/ui/nani_home_page.dart';
import 'package:parent_app/pages/nani/nani_sending_request/ui/nani_sending_request_page.dart';
import 'package:parent_app/pages/onboarding/onboarding_page.dart';
import 'package:parent_app/pages/parent/home/cubit/parent_home_cubit.dart';
import 'package:parent_app/pages/parent/home/ui/parent_home_page.dart';
import 'package:parent_app/pages/parent/request_done/ui/request_done_page.dart';
import 'package:parent_app/pages/parent/sending_request/ui/sending_request_page.dart';
import 'package:parent_app/pages/registration/ui/registration_page.dart';
import 'package:parent_app/pages/start/start_page.dart';

enum AppRoute {
  start,
  registration,
  login,
  parenthome,
  sendingrequest,
  requestdone,
  nanihome,
  nanisendrequest,
  nanicurrentvisit,
  onboarding
}

class AppRouter {
  static GoRouter goRouter = GoRouter(
      initialLocation:
          //
          '/parent-home',
      // '/start',
      // '/nani-home',
      // '/onboarding',
      // '/login',
      // '/sending-request',
      // '/request-done',
      // '/nani-home',
      // '/nani-send-request',
      // '/nani-current-visit',
      routes: <RouteBase>[
        GoRoute(
          path: '/start',
          name: AppRoute.start.name,
          builder: (context, state) {
            return const StartPage();
          },
        ),
        GoRoute(
          path: '/onboarding',
          name: AppRoute.onboarding.name,
          builder: (context, state) {
            return OnboardingPage();
          },
        ),
        GoRoute(
          path: '/registration',
          name: AppRoute.registration.name,
          builder: (context, state) {
            return const RegistrationPage();
          },
        ),
        GoRoute(
          path: '/login',
          name: AppRoute.login.name,
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        //// parent
        GoRoute(
          path: '/parent-home',
          name: AppRoute.parenthome.name,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => ParentHomeCubit(),
              child: const ParentHomePage(),
            );
          },
        ),
        GoRoute(
          path: '/sending-request',
          name: AppRoute.sendingrequest.name,
          builder: (context, state) {
            return const SendingRequestPage();
          },
        ),
        GoRoute(
          path: '/request-done',
          name: AppRoute.requestdone.name,
          builder: (context, state) {
            return const RequestDonePage();
          },
        ),
        ////// nani
        GoRoute(
          path: '/nani-home',
          name: AppRoute.nanihome.name,
          builder: (context, state) {
            return const NaniHomePage();
          },
        ),
        GoRoute(
          path: '/nani-send-request',
          name: AppRoute.nanisendrequest.name,
          builder: (context, state) {
            return NaniSendingRequestPage();
          },
        ),
        GoRoute(
          path: '/nani-current-visit',
          name: AppRoute.nanicurrentvisit.name,
          builder: (context, state) {
            return NaniCurrentVisitPage();
          },
        )
      ]);
}

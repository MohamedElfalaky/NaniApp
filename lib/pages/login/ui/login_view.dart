import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/pages/login/cubit/login_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';
import 'package:parent_app/util/globals.dart';
import 'package:parent_app/util/validators.dart';

final class LoginView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeOF = Theme.of(context);

    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Container(
                  padding: EdgeInsets.all(AppSpaces.padding_16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(18.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Welcome to",
                        style: themeOF.textTheme.headlineMedium,
                      ),
                      Gap(AppSpaces.padding_8.h),
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Image.asset(appLogo)),
                      Gap(AppSpaces.padding_16.h),
                      Text(
                        "Sign in now to book hassle-free\n childcare!",
                        style: themeOF.textTheme.bodyLarge!
                            .copyWith(color: themeOF.colorScheme.secondary),
                      ),
                      Gap(AppSpaces.padding_24.h),
                      TextFormField(
                          decoration: InputDecoration(hintText: "Email adress"),
                          controller: _mailController,
                          validator: (value) => Validator.validateEmail(value)),
                      Gap(AppSpaces.padding_16.h),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Password"),
                        controller: _passwordController,
                        validator: (value) => Validator.validateNotEmptyField(
                            value, "Password cant be empty"),
                      ),
                      Gap(AppSpaces.padding_24.h),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return appLoader;
                          } else {
                            return ElevatedButton(
                                onPressed: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    context.read<LoginCubit>().userLogin(
                                        mail: _mailController.text,
                                        password: _passwordController.text);
                                  }
                                },
                                child: Text("Sign in"));
                          }
                        },
                      ),
                      Gap(AppSpaces.padding_24.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: themeOF.textTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () => AppRouter.goRouter
                                .pushNamed(AppRoute.registration.name),
                            child: Text(
                              "Sign up",
                              style: themeOF.textTheme.headlineSmall!
                                  .copyWith(color: themeOF.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      Gap(AppSpaces.padding_56.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Switch to ",
                            style: themeOF.textTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              if (!isNani) {
                                isNani = true;
                                AppRouter.goRouter
                                    .pushReplacementNamed(AppRoute.login.name);
                              } else {
                                isNani = false;
                                AppRouter.goRouter
                                    .pushReplacementNamed(AppRoute.login.name);
                              }
                            },
                            child: Text(
                              !isNani
                                  ? "Nanny Now | Caregivers"
                                  : "Nanny Now | Parents",
                              style: themeOF.textTheme.headlineSmall!
                                  .copyWith(color: themeOF.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

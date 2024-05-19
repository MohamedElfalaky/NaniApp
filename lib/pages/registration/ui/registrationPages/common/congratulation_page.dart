import 'package:flutter/material.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

class CongratulationPage extends StatefulWidget {
  CongratulationPage({
    super.key,
  });

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.padding_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(registeredIcon),
            Text(
              "Your Childcare Journey Begins Now",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              "Congratulations! 🎉 on completing your sign-up! You're now set to schedule a home visit for your children. Choose your preferred date and time, and let us handle the rest. 😍 Welcome aboard!",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("How Our App Works !")),
                // ignore: prefer_const_constructors
                TextButton(onPressed: () {}, child: Text("Done")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/widgets/upload_file_container.dart';

class NaniDocumentsPage extends StatefulWidget {
  NaniDocumentsPage({
    super.key,
  });

  @override
  State<NaniDocumentsPage> createState() => _NaniDocumentsPageState();
}

class _NaniDocumentsPageState extends State<NaniDocumentsPage>
    with AutomaticKeepAliveClientMixin<NaniDocumentsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documents"),
        leading: BackButton(
          onPressed: () {
            context.read<RegistrationCubit>().previousPage();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.padding_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Please upload following documents File size limit: 5 MB",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Gap(24.h),
                    const UploadFileContainer(
                      title: "Personal image",
                      body:
                          "Upload a recent image of yourself with clear background",
                    ),
                    Gap(16.h),
                    const UploadFileContainer(
                      title: "National ID scan",
                      body:
                          "If you’re not Egyptian you can upload a scan of your passport",
                    ),
                    Gap(16.h),
                    const UploadFileContainer(
                      title: "Resume",
                      body: "An up-to-date version of your C.V. or resume",
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4 out of 6',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text('Next: Payment & Billing',
                    style: Theme.of(context).textTheme.labelSmall)
              ],
            ),
            Gap(6.h),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    6,
                    (index) => Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                end: AppSpaces.padding_4),
                            height: AppSpaces.padding_8,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSpaces.padding_4),
                                color: index < 4
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary),
                          ),
                        ))),
            Gap(6.h),
            ElevatedButton(
                onPressed: () {
                  context.read<RegistrationCubit>().nextPage();
                },
                child: const Text("Next")),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/Icons.dart';

class UploadFileContainer extends StatelessWidget {
  final String title;
  final String body;
  const UploadFileContainer({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpaces.padding_16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
          )),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  body,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(downloadIocn)
        ],
      ),
    );
  }
}

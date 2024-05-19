import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/data/models/parent_model.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChildWidget extends StatefulWidget {
  ChildModel model;

  ChildWidget({
    required this.model,
    super.key,
  });

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  late TextEditingController _childNameController;
  late TextEditingController _childAgeController;

  @override
  Widget build(BuildContext context) {
    widget.model.name = widget.model.name ?? "";
    widget.model.age = widget.model.age ?? "";
    _childNameController = TextEditingController(text: widget.model.name ?? "");
    _childAgeController = TextEditingController(text: widget.model.age ?? "");
    widget.model.gender = widget.model.gender ?? "male";
    widget.model.prefActivities = widget.model.prefActivities != null
        ? [...widget.model.prefActivities!]
        :
        //  [...context.read<RegistrationCubit>().mainPrefList]; TODO

        [
            {"name": "Arts & crafts", "isSelected": false},
            {"name": "Storytelling", "isSelected": false},
            {"name": "Music", "isSelected": false},
            {"name": "Football", "isSelected": false},
          ];

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpaces.padding_8),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {});
        },
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        title: Row(
          children: [
            Text(
              "👉🏻  ${widget.model.name!.isEmpty ? "child name, " : widget.model.name} ${widget.model.age!.isEmpty ? "age" : widget.model.age}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  context
                      .read<RegistrationCubit>()
                      .deleteChild(widget.model.id);
                },
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ))
          ],
        ),
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  onTapOutside: (event) {
                    setState(() {});
                  },
                  onChanged: (value) {
                    widget.model.name = value;
                  },
                  controller: _childNameController,
                  decoration:
                      const InputDecoration(hintText: 'Child First Name'),
                ),
              ),
              Gap(16.w),
              Expanded(
                flex: 1,
                child: TextFormField(
                  onTapOutside: (event) {
                    setState(() {});
                  },
                  controller: _childAgeController,
                  onChanged: (value) {
                    widget.model.age = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Age'),
                ),
              ),
            ],
          ),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.model.gender = "male";
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppSpaces.padding_8),
                    decoration: BoxDecoration(
                        color: widget.model.gender == "male"
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Text(
                      "👦🏻  Male",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: widget.model.gender == "male"
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).primaryColorDark),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Gap(16.w),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.model.gender = "female";
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppSpaces.padding_8),
                    decoration: BoxDecoration(
                        color: widget.model.gender == "female"
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Text(
                      "👧🏼  Female",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: widget.model.gender == "female"
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(16.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Preferred Activities",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Wrap(
            children: widget.model.prefActivities!
                .map((e) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => setState(() {
                        e["isSelected"] = !(e["isSelected"] as bool);
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        margin: const EdgeInsets.all(AppSpaces.padding_8),
                        padding: const EdgeInsets.all(AppSpaces.padding_8),
                        decoration: BoxDecoration(
                            color: e["isSelected"] == true
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Text(
                          e["name"] as String,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: e["isSelected"] == true
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context).primaryColorDark),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
                .toList(),
          ),
          Gap(12.h),
        ],
      ),
    );
  }
}

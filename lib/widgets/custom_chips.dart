import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/resources/spacings/spacings.dart';

// ignore: must_be_immutable
class CustomChips extends StatefulWidget {
  bool isSelected;
  final String value;
  List addedList;

  void Function(bool)? onChange;

  CustomChips(
      {super.key,
      this.isSelected = false,
      required this.value,
      required this.addedList,
      this.onChange});

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  // bool? isSelected;
  @override
  Widget build(BuildContext context) {
    widget.isSelected = widget.addedList.contains(widget.value);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;

          {
            if (widget.isSelected) {
              if (!widget.addedList.contains(widget.value)) {
                widget.addedList.add(widget.value);
              }
            } else {
              widget.addedList.removeWhere(
                (element) => element == widget.value,
              );
            }

            print("smsks ${widget.addedList}");
          }
          // widget.onChange(widget.isSelected);
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            end: AppSpaces.padding_8, bottom: AppSpaces.padding_4),
        padding: const EdgeInsets.all(AppSpaces.padding_8),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(8.r)),
        child: Text(
          widget.value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: widget.isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).primaryColorDark),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

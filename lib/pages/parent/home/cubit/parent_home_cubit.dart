import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:parent_app/data/models/parent_user_model/parent.dart';

import '../../../../data/models/parent_home_model/nani_request_model.dart';
import '../../../../data/models/parent_model.dart';
import '../../../../data/models/parent_user_model/parent_user_model.dart';
import '../../../../data/repository/home_repo.dart';
import '../../../../feature/settings/cache_services.dart';

part 'parent_home_state.dart';

class ParentHomeCubit extends Cubit<ParentHomeState> {
  ParentHomeCubit() : super(ParentHomeInitial());

  ParentHomeRepo parentHomeRepo = ParentHomeRepo();

  int additionalChildren = 0;
  List<String> selectedChildren = [];
  bool isChildrenSelected = false;
  int totalPrice = 0;
  bool check = false;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  void addChildren(String childrenId) {
    if (selectedChildren.contains(childrenId)) {
      selectedChildren.remove(childrenId);
      if (selectedChildren.isEmpty) {
        isChildrenSelected = false;
        emit(ChildrenSelected());
      }
    } else {
      selectedChildren.add(childrenId);
      isChildrenSelected = true;
      emit(ChildrenSelected());
    }
    isChildrenSelected = selectedChildren.isNotEmpty;
    emit(ChildrenSelected());
  }

  void addAdditionalChildren() {
    additionalChildren++;
    emit(AdditionalChildrenChanged(
      additionalChildren: additionalChildren,
    ));
  }

  void removeAdditionalChildren() {
    if (additionalChildren > 0) {
      additionalChildren--;
      emit(AdditionalChildrenChanged(
        additionalChildren: additionalChildren,
      ));
    }
  }

  void checkChildren() {
    check = !check;
    emit(CheckBoxState());
  }

  Future<void> getPrice() async {
    emit(GetChildrenPriceLoading());
    try {
      Map<String, dynamic> price = await parentHomeRepo.getPrice(
        childrenId: selectedChildren,
        additionalChildren: additionalChildren,
        parentId: CacheServices.instance.getParentModel()!.parent!.id!,
      );
      totalPrice = price['price'];
      emit(GetChildrenPriceSuccess(
        price: price['price'],
      ));
    } catch (e, st) {
      emit(GetChildrenPriceError());
      print(e);
    }
  }

  Future<void> requestNani() async {
    emit(RequestNaniLoading());
    try {
      final parent = CacheServices.instance.getParentModel()!.parent!;
      final NaniRequestModel naniRequestModel =
          await parentHomeRepo.requestNani(
        parentId: parent.id!,
        parentAddressId: parent.parentAddresses![0].id!.toString(),
        from: fromController.text,
        to: toController.text,
        notes: '',
        couponCode: '',
        webcam: true,
        additionalChildren: additionalChildren,
        children: selectedChildren,
      );
      emit(RequestNaniSuccess(
        naniRequestModel: naniRequestModel,
      ));
    } catch (e, st) {
      emit(RequestNaniError());
      print(e);
    }
  }
}

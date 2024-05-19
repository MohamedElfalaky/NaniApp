import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:parent_app/pages/registration/cubit/registration_cubit.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/text_styles.dart';

class ParentLocationPage extends StatefulWidget {
  ParentLocationPage({
    super.key,
  });

  @override
  State<ParentLocationPage> createState() => _ParentLocationPageState();
}

class _ParentLocationPageState extends State<ParentLocationPage>
    with AutomaticKeepAliveClientMixin<ParentLocationPage> {
  final _registrationFormKey = GlobalKey<FormState>();

  final _districtController = TextEditingController();

  final _streetAddressNameController = TextEditingController();

  final _buildingNoController = TextEditingController();
  final _apartmentNoController = TextEditingController();
  final _landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location & Address"),
        leading: BackButton(
          onPressed: () {
            context.read<RegistrationCubit>().previousPage();
          },
        ),
      ),
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is GetLocationSuccess) {
            _districtController.text = state.locationList[0];
            _streetAddressNameController.text = state.locationList[1];
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSpaces.padding_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Form(
                  key: _registrationFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Where do you live?",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),

                        Gap(24.h),

                        /// First Name Text Field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _districtController,
                          decoration: const InputDecoration(
                              hintText: 'District ex. 5th settlement'),
                          validator: (value) => context
                              .read<RegistrationCubit>()
                              .validateNotEmptyField(
                                  value, 'District can not be empty'),
                        ),

                        Gap(12.h),

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _streetAddressNameController,
                          decoration:
                              const InputDecoration(hintText: "Street address"),
                          validator: (value) => context
                              .read<RegistrationCubit>()
                              .validateNotEmptyField(
                                  value, 'Street address can not be empty'),
                        ),

                        Gap(12.h),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                controller: _buildingNoController,
                                decoration: const InputDecoration(
                                    hintText: "Building no."),
                                validator: (value) => context
                                    .read<RegistrationCubit>()
                                    .validateNotEmptyField(
                                        value, 'Building no. can not be empty'),
                              ),
                            ),
                            Gap(12.w),
                            Expanded(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                controller: _apartmentNoController,
                                decoration: const InputDecoration(
                                    hintText: "Apartment no."),
                                validator: (value) => context
                                    .read<RegistrationCubit>()
                                    .validateNotEmptyField(value,
                                        'Apartment no. can not be empty'),
                              ),
                            ),
                          ],
                        ),

                        Gap(12.h),

                        /// Last Name Text Field

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _landmarkController,
                          decoration: const InputDecoration(
                              hintText: "Remarkable landmark near home"),
                        ),
                        Gap(24.h),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "or get the exact location",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Gap(16.h),
                        BlocBuilder<RegistrationCubit, RegistrationState>(
                          builder: (context, state) {
                            if (state is GetLocationLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                        textStyle: TextStyles.body16Regulat),
                                    onPressed: () async {
                                      context
                                          .read<RegistrationCubit>()
                                          .getLocation();
                                    },
                                    child: const Text("Locate me!")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2 out of 5',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text('Next: Children',
                      style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
              Gap(6.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5,
                      (index) => Expanded(
                            child: Container(
                              margin: EdgeInsetsDirectional.only(
                                  end: AppSpaces.padding_4),
                              height: AppSpaces.padding_8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppSpaces.padding_4),
                                  color: index < 2
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                          ))),
              Gap(6.h),
              ElevatedButton(
                  onPressed: () {
                    if (_registrationFormKey.currentState?.validate() ??
                        false) {
                      addDataToRegistrationModel();
                      context.read<RegistrationCubit>().nextPage();
                      // goRouter.pushNamed(AppRoute.login.name);
                    }
                  },
                  child: const Text("Next")),
            ],
          ),
        ),
      ),
    );
  }

  addDataToRegistrationModel() {
    context
        .read<RegistrationCubit>()
        .parentRegistrationModel!
        .parent
        .parentAddresses!
        .first
        .district = _districtController.text;
    context
        .read<RegistrationCubit>()
        .parentRegistrationModel!
        .parent
        .parentAddresses!
        .first
        .streetAddress = _streetAddressNameController.text;
    context
            .read<RegistrationCubit>()
            .parentRegistrationModel!
            .parent
            .parentAddresses!
            .first
            .buildingNo =
        int.parse(_buildingNoController.text.isEmpty
            ? "0"
            : _buildingNoController.text);
    context
            .read<RegistrationCubit>()
            .parentRegistrationModel!
            .parent
            .parentAddresses!
            .first
            .apartmentNo =
        int.parse(_apartmentNoController.text.isEmpty
            ? "0"
            : _apartmentNoController.text);
    context
        .read<RegistrationCubit>()
        .parentRegistrationModel!
        .parent
        .parentAddresses!
        .first
        .remarkableLandmark = _landmarkController.text;
  }

  @override
  bool get wantKeepAlive => true;
}

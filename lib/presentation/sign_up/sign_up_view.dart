import 'dart:async';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_advanced/presentation/sign_up/view_model/signup_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/dependency_injection.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpViewState();
  }
}

class SignUpViewState extends State<SignUpView> {
  final SignupViewModel _viewModel = instance<SignupViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();

  final _firstNameTextEditingController = TextEditingController();
  final _lastNameTextEditingController = TextEditingController();
  final _countryMobileTextEditingCodeController = TextEditingController();
  final _mobileNumberTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  final _confirmPasswordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  _bind() {
    _firstNameTextEditingController.addListener(
        () => _viewModel.setFirstName(_firstNameTextEditingController.text));
    _lastNameTextEditingController.addListener(
        () => _viewModel.setLastName(_lastNameTextEditingController.text));
    _countryMobileTextEditingCodeController.addListener(() => _viewModel
        .setCountryMobileCode(_countryMobileTextEditingCodeController.text));
    _mobileNumberTextEditingController.addListener(() =>
        _viewModel.setMobileNumber(_mobileNumberTextEditingController.text));
    _emailTextEditingController.addListener(
        () => _viewModel.setEmail(_emailTextEditingController.text));
    _passwordTextEditingController.addListener(
        () => _viewModel.setPassword(_passwordTextEditingController.text));
    _confirmPasswordTextEditingController.addListener(() => _viewModel
        .setConfirmPassword(_confirmPasswordTextEditingController.text));
    _viewModel.isUserRegisteredSuccessfully.stream
        .listen((isUserRegisteredSuccessfully) {
      if (isUserRegisteredSuccessfully) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.popAndPushNamed(context, Routes.loginRoute);
        });
      }
    });
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          return currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {}) ??
                  _getContentWidget();
            },
          )),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(
          top: AppPadding.p50, left: AppPadding.p16, right: AppPadding.p16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              StreamBuilder<File>(
                  stream: _viewModel.outputProfilePicture,
                  builder: (context, snapshot) {
                    return CircleAvatar(
                        radius: AppSize.size50,
                        backgroundImage: FileImage(File(snapshot.data?.path ??
                            "/data/user/0/com.example.flutter_advanced/cache/image_picker8170486415324706240.jpg")));
                  }),
              const SizedBox(
                height: AppSize.size40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FirstName
                  Expanded(
                    child: buildCustomTextFormField(
                      _viewModel.outputFirstNameMessage,
                      TextInputType.name,
                      AppStringsManager.firstName.tr(),
                      _firstNameTextEditingController,
                    ),
                  ),
                  // Last name
                  Expanded(
                    child: buildCustomTextFormField(
                      _viewModel.outputLastNameMessage,
                      TextInputType.name,
                      AppStringsManager.lastName.tr(),
                      _lastNameTextEditingController,
                    ),
                  ),
                ],
              ),
              // Mobile Number
              buildCustomTextFormField(
                _viewModel.outputMobileNumberMessage,
                TextInputType.name,
                AppStringsManager.mobileNumber.tr(),
                _mobileNumberTextEditingController,
                prefixIcon: TextButton(
                  onPressed: () {
                    showCountryPicker(
                        context: context,
                        onSelect: (country) {
                          _viewModel
                              .setCountryMobileCode("+${country.phoneCode}");
                          _viewModel.setFlag(country.flagEmoji);
                        },
                        showPhoneCode: true);
                  },
                  child: StreamBuilder<String>(
                      stream: _viewModel.outputFlag,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? "🇪🇬",
                          style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSize.s24),
                        ).tr();
                      }),
                ),
              ),

              // email
              buildCustomTextFormField(
                  _viewModel.outputEmailMessage,
                  TextInputType.text,
                  AppStringsManager.email.tr(),
                  _emailTextEditingController),

              //Password
              buildCustomTextFormField(
                  _viewModel.outputPasswordMessage,
                  TextInputType.text,
                  AppStringsManager.password.tr(),
                  _passwordTextEditingController),

              //confirm password
              buildCustomTextFormField(
                  _viewModel.outputConfirmPasswordMessage,
                  TextInputType.text,
                  AppStringsManager.confirmPassword.tr(),
                  _confirmPasswordTextEditingController),

              // profile Picture
              _buildProfilePictureWidget(),
              const SizedBox(
                height: AppSize.size24,
              ),
              StreamBuilder<bool>(
                  stream: _viewModel.outputAreAllInputsValid,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  const Size(double.infinity, AppSize.size50)),
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.signup();
                                }
                              : null,
                          child: Text(
                            AppStringsManager.signup.tr(),
                          )),
                    );
                  }),
              const SizedBox(
                height: AppSize.size10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStringsManager.alreadyHaveAccount.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<String?> buildCustomTextFormField(
      Stream<String?>? stream,
      TextInputType? keyboardType,
      String? labelText,
      TextEditingController? controller,
      {Widget? prefixIcon}) {
    return StreamBuilder<String?>(
        stream: stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: keyboardType,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: InputDecoration(
                errorText: snapshot.data,
                errorMaxLines: 3,
                labelText: labelText,
                prefixIcon: prefixIcon,
              ),
              controller: controller,
            ),
          );
        });
  }

  _buildProfilePictureWidget() {
    return GestureDetector(
      onTap: () {
        _showPhotoPicker();
      },
      child: Container(
        padding: const EdgeInsets.all(AppSize.size8),
        height: AppSize.size50,
        margin: const EdgeInsets.all(AppSize.size8),
        decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.grayColor1),
            borderRadius: BorderRadius.circular(AppSize.size16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStringsManager.profilePicture.tr(),
              style: getRegularStyle(
                  color: ColorsManager.primaryColor, fontSize: FontSize.s14),
            ),
          ],
        ),
      ),
    );
  }

  _showPhotoPicker() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  title: const Text(AppStringsManager.photoFromGallery).tr(),
                  trailing: const Icon(Icons.browse_gallery),
                  onTap: () {
                    _getPhotoFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text(AppStringsManager.photoFromCamera).tr(),
                  trailing: const Icon(Icons.camera_enhance),
                  onTap: () {
                    _getPhotoFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getPhotoFromCamera() async {
    var photo = await _imagePicker.pickImage(source: ImageSource.camera);
    _viewModel.setProfilePicture(File(photo?.path ?? ""));
  }

  _getPhotoFromGallery() async {
    var photo = await _imagePicker.pickImage(source: ImageSource.gallery);
    _viewModel.setProfilePicture(File(photo?.path ?? ""));
  }
}

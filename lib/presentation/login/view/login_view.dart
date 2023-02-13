import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
import 'package:flutter_advanced/presentation/login/view_model/login_view_model.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

import '../../common/state_renderer/state_renderer_implementation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  _bind() {
    _userNameTextEditingController.addListener(
        () => _viewModel.setUserName(_userNameTextEditingController.text));
    _passwordTextEditingController.addListener(
        () => _viewModel.setPassword(_passwordTextEditingController.text));
    _viewModel.isUserLoggedInStreamController.stream.listen((isUserLogged) {
      if (isUserLogged) {
        _appPreferences.setLoggedIn();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
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
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(
          top: AppPadding.p100, left: AppPadding.p16, right: AppPadding.p16),
      child: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.size150,
                  height: AppSize.size180,
                )),
                const SizedBox(
                  height: AppSize.size50,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStringsManager.loginErrMassage,
                          hintText: AppStringsManager.username,
                        ),
                        controller: _userNameTextEditingController,
                      );
                    }),
                const SizedBox(
                  height: AppSize.size20,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.displaySmall,
                        decoration: InputDecoration(
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStringsManager.loginErrMassage,
                          hintText: AppStringsManager.password,
                        ),
                        controller: _passwordTextEditingController,
                      );
                    }),
                const SizedBox(
                  height: AppSize.size50,
                ),
                StreamBuilder<bool>(
                    stream: _viewModel.outAreAllInputsValid,
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  const Size(double.infinity, AppSize.size50)),
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: const Text(
                            AppStringsManager.login,
                          ));
                    }),
                const SizedBox(
                  height: AppSize.size10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppStringsManager.forgetPassword,
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUpRoute);
                        },
                        child: Text(
                          AppStringsManager.signUp,
                          style: Theme.of(context).textTheme.bodySmall,
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

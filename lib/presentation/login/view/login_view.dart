import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }

  _bind() {
    _userNameTextEditingController.addListener(
        () => _loginViewModel.setUserName(_userNameTextEditingController.text));
    _passwordTextEditingController.addListener(
        () => _loginViewModel.setPassword(_passwordTextEditingController.text));
    _loginViewModel.isUserLoggedInStreamController.stream
        .listen((isUserLogged) {
      if (isUserLogged) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        });
      }
    });
    _loginViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(), () {}) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(
          top: AppPadding.p100, left: AppPadding.p50, right: AppPadding.p50),
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
                    stream: _loginViewModel.outIsUserNameValid,
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
                    stream: _loginViewModel.outIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.headline3,
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
                    stream: _loginViewModel.outAreAllInputsValid,
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  const Size(double.infinity, AppSize.size50)),
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _loginViewModel.login();
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
                          style: Theme.of(context).textTheme.headline5,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUpRoute);
                        },
                        child: Text(
                          AppStringsManager.signUp,
                          style: Theme.of(context).textTheme.headline5,
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

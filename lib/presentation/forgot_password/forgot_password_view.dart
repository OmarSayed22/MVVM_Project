import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/forgot_password/forgot_password_view_model.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

import '../../application/dependency_injection.dart';
import '../common/state_renderer/state_renderer_implementation.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordViewState();
  }
}

class ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgetPasswordViewModel _forgetPasswordViewModel =
      instance<ForgetPasswordViewModel>();

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final formKey = GlobalKey();

  _bind() {
    _emailTextEditingController.addListener(() {
      _forgetPasswordViewModel.setEmail(_emailTextEditingController.text);
    });
    _forgetPasswordViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _forgetPasswordViewModel.dispose();
    super.dispose();
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
          stream: _forgetPasswordViewModel.outputState,
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
          top: AppPadding.p100, left: AppPadding.p50, right: AppPadding.p50),
      child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(children: [
                Center(
                    child: Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.size150,
                  height: AppSize.size180,
                )),
                const SizedBox(
                  height: AppSize.size50,
                ),
                StreamBuilder<bool?>(
                    stream: _forgetPasswordViewModel.outputIsEmailValid(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.headline3,
                            decoration: InputDecoration(
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStringsManager.emailErrMassage,
                              hintText: AppStringsManager.username,
                            ),
                            controller: _emailTextEditingController,
                          ),
                          const SizedBox(
                            height: AppSize.size50,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(
                                      double.infinity, AppSize.size50)),
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _forgetPasswordViewModel.resetPassword();
                                    }
                                  : null,
                              child: const Text(
                                AppStringsManager.resetPassword,
                              ))
                        ],
                      );
                    }),
              ]))),
    );
  }
}

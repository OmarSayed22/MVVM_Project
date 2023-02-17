import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_advanced/presentation/store_details/view_model/store_details_view_model.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return StoreDetailsState();
  }
}

class StoreDetailsState extends State<StoreDetails> {
  final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStringsManager.storeDetails.tr(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: StreamBuilder<FlowState>(
              stream: _viewModel.outputState,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data
                          ?.getScreenWidget(context, contentScreenWidget(), () {
                        _viewModel.start();
                      }) ??
                      contentScreenWidget();
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  Widget contentScreenWidget() {
    return StreamBuilder<StoreDetailsViewObject>(
        stream: _viewModel.outputStoreDetails,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final data = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getImage(data.image),
                const SizedBox(
                  height: AppSize.size16,
                ),
                _getTitle(AppStringsManager.details.tr()),
                _getBodyDetails(data.details),
                _getTitle(AppStringsManager.services.tr()),
                _getBodyDetails(data.services),
                _getTitle(AppStringsManager.aboutStore.tr()),
                _getBodyDetails(data.about),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  ClipRRect _getImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.size12),
      child: Image.network(
        width: double.infinity,
        height: AppSize.size200,
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p8,
            top: AppPadding.p16,
            right: AppPadding.p4,
            bottom: AppPadding.p4),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge,
        ));
  }

  _getBodyDetails(String text) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: AppSize.size12.toInt(),
      ),
    );
  }
}

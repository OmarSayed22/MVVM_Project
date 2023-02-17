import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced/domain/models/models.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:flutter_advanced/presentation/main/home/viewmodel/home_view_model.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

import '../../../../application/dependency_injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!
                    .getScreenWidget(context, _getContentWidget(), () {
                  _viewModel.start();
                });
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();

    super.dispose();
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBanners(snapshot.data?.banners),
              _getTitle(AppStringsManager.services.tr()),
              _getServices(snapshot.data?.services),
              _getTitle(AppStringsManager.stores.tr()),
              _getStores(snapshot.data?.stores),
            ],
          );
        });
  }

  Widget _getBanners(List<Banners>? banners) {
    if (banners != null) {
      return CarouselSlider(
          items: banners
              .map((banner) => SizedBox(
                    width: double.infinity,
                    child: Card(
                      shadowColor: ColorsManager.grayColor1,
                      elevation: AppSize.size1_5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.size10),
                          side: const BorderSide(
                            width: AppSize.size1,
                            color: Colors.transparent,
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.size10),
                        child: Image.network(
                          height: AppSize.size100,
                          banner.image,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlayCurve: Curves.linearToEaseOut,
            height: AppSize.size150,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: true,
          ));
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _getTitle(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p12,
            top: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }

  Widget _getStores(List<Stores>? stores) {
    if (stores != null) {
      return GridView.count(
          crossAxisSpacing: AppSize.size8,
          mainAxisSpacing: AppSize.size8,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppPadding.p8),
          crossAxisCount: AppSize.size1.toInt(),
          children: List.generate(stores.length, (index) {
            return InkWell(
              onTap: () {
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.pushNamed(context, Routes.storeDetailsRoute);
                  },
                );
              },
              child: Card(
                shadowColor: ColorsManager.grayColor1,
                elevation: AppSize.size1_5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.size10),
                    side: const BorderSide(
                      width: AppSize.size1,
                      color: Colors.transparent,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.size10),
                  child: Image.network(
                    height: AppSize.size100,
                    stores[index].image,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }).toList());
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _getServices(List<Services>? services) {
    if (services != null) {
      return Container(
        height: AppSize.size145,
        margin: const EdgeInsets.all(AppSize.size8),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            itemBuilder: (context, index) {
              Services service = services[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                child: SizedBox(
                  width: AppSize.size125,
                  child: Card(
                    elevation: AppSize.size1_5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.size10),
                        side: const BorderSide(
                          width: AppSize.size1,
                          color: Colors.transparent,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.size10),
                          child: Image.network(
                            height: AppSize.size100,
                            service.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.size8,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSize.size6),
                            child: Text(
                              service.title,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

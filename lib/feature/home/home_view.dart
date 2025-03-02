import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/state.dart';
import 'package:salonmate/feature/home/home_viewmodel.dart';
import 'package:salonmate/feature/map/map_view.dart';
import 'package:salonmate/feature/notification/notification_view.dart';
import 'package:salonmate/feature/salons/salons_view.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/feature/services/services_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/banner_card.dart';
import 'package:salonmate/product/widget/widget/category_card.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
import 'package:salonmate/product/widget/widget/salon_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        title: Row(
          children: <Widget>[
            AppIcons.locationFill.toSvgImg(
              Theme.of(context).colorScheme.primary,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
            Expanded(
              child: Padding(
                padding: BaseUtility.horizontal(
                  BaseUtility.paddingNormalValue,
                ),
                child: Column(
                  children: <Widget>[
                    // title
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.vertical(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: BodyMediumBlackText(
                          text:
                              AppLocalizations.of(context)!.home_welcome_appbar,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // city district
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: TitleMediumBlackBoldText(
                          text:
                              '${userProvider.user?.userDetail.city ?? AppLocalizations.of(context)!.home_unknown}/${userProvider.user?.userDetail.district ?? AppLocalizations.of(context)!.home_unknown}',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          // notification
          Padding(
            padding: BaseUtility.right(
              BaseUtility.paddingNormalValue,
            ),
            child: IconButton(
              onPressed: () => CodeNoahNavigatorRouter.push(
                context,
                const NotificationView(),
              ),
              icon: AppIcons.notification.toSvgImg(
                null,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: <Widget>[
                  // search
                  buildSearchWidget,
                  // banner card
                  buildBannerCardWidget,
                  // category
                  buildServiceCategorys(state.categorys),
                  // salons
                  buildSalonsWidget(state.salons),
                ],
              ),
            );
          } else if (state is HomeError) {
            return CustomResponseWidget(
              img: AppImages.notfound.toSvgImg(
                null,
                dynamicViewExtensions.maxWidth(context),
                dynamicViewExtensions.dynamicHeight(
                  context,
                  0.2,
                ),
              ),
              title: 'Hata Oluştu!',
              subTitle: state.errorMessage,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  // search
  Widget get buildSearchWidget => Padding(
        padding: BaseUtility.bottom(
          BaseUtility.paddingMediumValue,
        ),
        child: GestureDetector(
          onTap: () => CodeNoahNavigatorRouter.push(
            context,
            const SalonsView(),
          ),
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(context, 0.06),
            child: Container(
              padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
              margin: BaseUtility.bottom(BaseUtility.paddingSmallValue),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.09),
                borderRadius: BorderRadius.circular(
                  BaseUtility.radiusCircularMediumValue,
                ),
              ),
              child: Row(
                children: <Widget>[
                  AppIcons.search.toSvgImg(
                    Colors.black54,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
                  Expanded(
                    child: Padding(
                      padding: BaseUtility.horizontal(
                        BaseUtility.paddingNormalValue,
                      ),
                      child: BodyMediumBlackText(
                        text: AppLocalizations.of(context)!.home_search,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // banner card
  Widget get buildBannerCardWidget => BannerCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        onTap: () {},
        title: AppLocalizations.of(context)!.home_banner_card_title,
        subTitle: AppLocalizations.of(context)!.home_banner_card_sub_title,
        explanation: AppLocalizations.of(context)!.home_banner_card_explanation,
      );

  //  category
  Widget buildServiceCategorys(List<ServiceCategory> categorys) =>
      categorys.isEmpty
          ? const SizedBox()
          : Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingSmallValue,
              ),
              child: Column(
                children: <Widget>[
                  // list title
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.vertical(
                        BaseUtility.paddingNormalValue,
                      ),
                      child: TitleLargeBlackBoldText(
                        text: AppLocalizations.of(context)!.home_services_title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // list
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    height: dynamicViewExtensions.dynamicHeight(
                      context,
                      0.06,
                    ),
                    child: ListView.builder(
                      itemCount: categorys.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final model = categorys[index];
                        return CategoryCard(
                          onTap: () => CodeNoahNavigatorRouter.push(
                            context,
                            ServicesView(
                              categoryId: model.id,
                              categoryModel: model,
                            ),
                          ),
                          categoryModel: model,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

  // salons
  Widget buildSalonsWidget(List<SalonModel> salons) => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingMediumValue,
        ),
        child: Column(
          children: <Widget>[
            // list title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TitleLargeBlackBoldText(
                        text: AppLocalizations.of(context)!.home_salons_title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => CodeNoahNavigatorRouter.push(
                        context,
                        const MapView(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          AppIcons.mapOutline.toSvgImg(
                            Theme.of(context).colorScheme.primary,
                            BaseUtility.iconMediumSize,
                            BaseUtility.iconMediumSize,
                          ),
                          Padding(
                            padding: BaseUtility.left(
                              BaseUtility.paddingMediumValue,
                            ),
                            child: BodyMediumMainColorBoldText(
                              text: AppLocalizations.of(context)!
                                  .home_view_on_map,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // list
            ListView.builder(
              itemCount: salons.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final model = salons[index];

                return SalonCardWidget(
                  onTap: () => CodeNoahNavigatorRouter.push(
                    context,
                    SalonDetailView(
                      salonId: model.id,
                    ),
                  ),
                  dynamicViewExtensions: dynamicViewExtensions,
                  salonModel: model,
                );
              },
            ),
          ],
        ),
      );
}

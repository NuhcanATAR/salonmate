import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/stylist_select/stylist_select_view.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_viewmodel.dart';
import 'package:salonmate/feature/salons/view/salon_information/salon_information_view.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/widget/service_card.dart';

class SalonDetailView extends StatefulWidget {
  const SalonDetailView({
    super.key,
    required this.salonId,
  });

  final int salonId;

  @override
  State<SalonDetailView> createState() => _SalonDetailViewState();
}

class _SalonDetailViewState extends SalonDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: favoriteToggle,
            icon: favoriteStatus
                ? AppIcons.favorite.toSvgImg(
                    Colors.red,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  )
                : AppIcons.favoriteOutline.toSvgImg(
                    Colors.black,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
          ),
        ],
      ),
      body: BlocBuilder<SalonsBloc, SalonsState>(
        builder: (context, state) {
          favoriteStatus = favoriteStatus;
          if (state is FavoriteToggleSuccessState) {
            favoriteStatus = state.isFavorite;
          }
          if (state is SalonDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SalonDetailLoadedState) {
            return Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  // body
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        // cover image
                        buildSalonCoverImageWidget(state.salonModel),
                        // salon information
                        buildSalonInformationWidget(state.salonModel),
                        // rating
                        buildRatingWidget(state.salonModel),
                        // services
                        buildServicesWidget(state.services, state.salonModel),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SalonDetailErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  // cover image
  Widget buildSalonCoverImageWidget(SalonDetailModel model) => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          height: dynamicViewExtensions.dynamicHeight(context, 0.3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  BaseUtility.radiusCircularNormalValue,
                ),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  model.fileName,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  // salon information
  Widget buildSalonInformationWidget(SalonDetailModel model) => Column(
        children: <Widget>[
          // name
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TitleLargeBlackBoldText(
                      text: model.name,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    onPressed: () => CodeNoahNavigatorRouter.push(
                      context,
                      SalonInformationView(
                        salonModel: model,
                      ),
                    ),
                    icon: AppIcons.arrowRight.toSvgImg(
                      Theme.of(context).colorScheme.primary,
                      BaseUtility.iconMediumSecondSize,
                      BaseUtility.iconMediumSecondSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // city / district
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Row(
                children: <Widget>[
                  AppIcons.locationFill.toSvgImg(
                    Colors.black54,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
                  Expanded(
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: '${model.city}/${model.district}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // address
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Row(
                children: <Widget>[
                  AppIcons.locationMap.toSvgImg(
                    Colors.black54,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
                  Expanded(
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: model.address,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // open close time
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Row(
                children: <Widget>[
                  AppIcons.clockOutline.toSvgImg(
                    Colors.black54,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
                  Expanded(
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            '${model.openTime.hour}:${model.openTime.minute} - ${model.closeTime.hour}:${model.closeTime.minute}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  // rating
  Widget buildRatingWidget(SalonDetailModel model) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: BaseUtility.bottom(
            BaseUtility.paddingNormalValue,
          ),
          child: Row(
            children: <Widget>[
              AppIcons.star.toSvgImg(
                Colors.yellow,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
              Expanded(
                child: Padding(
                  padding: BaseUtility.left(
                    BaseUtility.paddingMediumValue,
                  ),
                  child: BodyMediumBlackText(
                    text:
                        '${model.avarageScore.toString()} (${model.totalAppointments.toInt()})',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // services
  Widget buildServicesWidget(
    List<Service> services,
    SalonDetailModel salonModel,
  ) =>
      SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Column(
          children: <Widget>[
            // list title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleLargeBlackBoldText(
                  text: 'Services',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // views
            ListView.builder(
              itemCount: services.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final model = services[index];

                return ServiceCardWidget(
                  dynamicViewExtensions: dynamicViewExtensions,
                  serviceModel: model,
                  serviceAddOnTap: () {
                    CodeNoahNavigatorRouter.push(
                      context,
                      StylistSelectView(
                        salonId: salonModel.salonId,
                        serviceModel: model,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
}

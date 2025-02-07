import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
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
            onPressed: () => Navigator.pop(context),
            icon: AppIcons.favoriteOutline.toSvgImg(
              Colors.black,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ),
        ],
      ),
      body: BlocBuilder<SalonsBloc, SalonsState>(
        builder: (context, state) {
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
                        buildRatingWidget,
                        // service category
                        buildServiceCategoryWidget,
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
              child: TitleLargeBlackBoldText(
                text: model.name,
                textAlign: TextAlign.left,
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
  Widget get buildRatingWidget => SizedBox(
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
                  child: const BodyMediumBlackText(
                    text: '4.7 (312)',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // service category
  Widget get buildServiceCategoryWidget => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Column(
          children: <Widget>[
            // tabbar
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: TitleLargeBlackBoldText(
                        text: 'Services',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const TitleMediumMainColorText(
                        text: 'All Services',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // views
            Column(
              children: <Widget>[
                // service card
                ServiceCardWidget(
                  dynamicViewExtensions: dynamicViewExtensions,
                ),
              ],
            ),
          ],
        ),
      );
}

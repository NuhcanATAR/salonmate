import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/favorite/bloc/cubit.dart';
import 'package:salonmate/feature/favorite/bloc/event.dart';
import 'package:salonmate/feature/favorite/bloc/state.dart';
import 'package:salonmate/feature/favorite/favorite_viewmodel.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
import 'package:salonmate/product/widget/widget/salon_card.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends FavoriteViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const BodyMediumBlackText(
          text: 'Favoriler',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          bool favoriteStatus = isFavorite;

          if (state is FavoriteToggleSuccessState) {
            favoriteStatus = state.isFavorite;
          }
          if (state is FavoriteLoadingState) {
            return buildLoadingWidget;
          } else if (state is FavoriteLoadedState) {
            return buildBodyWidget(
              state,
              favoriteStatus,
            );
          } else if (state is FavoriteErrorState) {
            return buildResponseWidget;
          }

          return const SizedBox();
        },
      ),
    );
  }

  // body
  Widget buildBodyWidget(FavoriteLoadedState state, bool favoriteStatus) =>
      Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: state.salons.isEmpty
            ? buildResponseWidget
            : ListView.builder(
                itemCount: state.salons.length,
                itemBuilder: (context, index) {
                  final model = state.salons[index];

                  return SalonCardWidget(
                    onTap: () {
                      CodeNoahNavigatorRouter.push(
                        context,
                        SalonDetailView(
                          salonId: model.salonId,
                        ),
                      );
                    },
                    dynamicViewExtensions: dynamicViewExtensions,
                    salonModel: model,
                    isFavorite: true,
                    favoriteOnPressed: () {
                      context.read<FavoriteBloc>().add(
                            FavoriteToggleEvent(
                              salonId: model.salonId,
                              isFavorite: isFavorite,
                              token: tokenValue,
                            ),
                          );
                    },
                    favoriteIcon: Icon(
                      favoriteStatus ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  );
                },
              ),
      );

  // response widget
  CustomResponseWidget get buildResponseWidget => CustomResponseWidget(
        img: AppImages.notfound.toSvgImg(
          null,
          dynamicViewExtensions.maxWidth(context),
          dynamicViewExtensions.dynamicHeight(context, 0.2),
        ),
        title: 'Favori Salonunuz Bulunmuyor',
        subTitle: 'Favori Salonunuz bulunmuyor',
      );

  // loading widget
  Widget get buildLoadingWidget => const CustomLoadingResponseWidget(
        title: 'Favoriler Yükleniyor',
        subTitle: 'Lütfen Bekleyiniz...',
      );
}

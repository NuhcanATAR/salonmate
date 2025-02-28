import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
import 'package:salonmate/feature/salons/salons_viewmodel.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
import 'package:salonmate/product/widget/widget/salon_card.dart';
import 'package:salonmate/product/widget/widget/search_field.dart';

class SalonsView extends StatefulWidget {
  const SalonsView({super.key});

  @override
  State<SalonsView> createState() => _SalonsViewState();
}

class _SalonsViewState extends SalonsViewModel {
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
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.salons_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: BlocBuilder<SalonsBloc, SalonsState>(
          buildWhen: (previous, current) =>
              current is FilteredSalonsState || current is SalonLoadedState,
          builder: (context, state) {
            List<SalonModel> salons = [];

            if (state is SalonsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SalonLoadedState) {
              salons = state.salons;
            } else if (state is FilteredSalonsState) {
              salons = state.filteredSalons;
            } else if (state is SalonErrorState) {
              return CustomResponseWidget(
                img: AppImages.failed.toSvgImg(
                  null,
                  200,
                  180,
                ),
                title: AppLocalizations.of(context)!.salons_error_title,
                subTitle: state.errorMessage ??
                    AppLocalizations.of(context)!
                        .salons_error_default_sub_title,
              );
            }

            return Column(
              children: <Widget>[
                // search
                buildSearchWidget,
                // body
                buildBodyWidget(salons),
              ],
            );
          },
        ),
      ),
    );
  }

  // search
  Widget get buildSearchWidget => CustomSearchFieldWidget(
        onChanged: (val) {
          context.read<SalonsBloc>().add(
                SearchSalonsEvent(
                  query: val,
                  context: context,
                ),
              );
        },
        controller: searchController,
        hintText: AppLocalizations.of(context)!.salons_search,
      );

  // body
  Widget buildBodyWidget(List<SalonModel> salons) => Expanded(
        child: Padding(
          padding: BaseUtility.top(BaseUtility.paddingNormalValue),
          child: salons.isEmpty
              ? CustomResponseWidget(
                  img: AppImages.notfound.toSvgImg(
                    null,
                    200,
                    180,
                  ),
                  title: AppLocalizations.of(context)!.salons_not_found_title,
                  subTitle:
                      AppLocalizations.of(context)!.salons_not_found_sub_title,
                )
              : ListView.builder(
                  itemCount: salons.length,
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
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/stylist_select/stylist_select_view.dart';
import 'package:salonmate/feature/services/bloc/cubit.dart';
import 'package:salonmate/feature/services/bloc/state.dart';
import 'package:salonmate/feature/services/services_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
import 'package:salonmate/product/widget/widget/service_card.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({
    super.key,
    required this.categoryId,
    required this.categoryModel,
  });

  final int categoryId;
  final ServiceCategory categoryModel;

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends ServicesViewModel {
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
          text: widget.categoryModel.name,
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoadingState) {
            return const CustomLoadingResponseWidget(
              title: 'Hizmetler Yükleniyor',
              subTitle: 'Lütfen Bekleyiniz...',
            );
          } else if (state is ServicesLoadedState) {
            return buildBodyWidget(state.services);
          } else if (state is ServicesErrorState) {
            return CustomResponseWidget(
              img: AppImages.notfound.toSvgImg(
                null,
                200,
                200,
              ),
              title:
                  '${widget.categoryModel.name} Adına Kayıtlı Bir hizmet bulunamadı!',
              subTitle: 'İsterseniz başka hizmetlere de bakabilirsiniz.',
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  // body
  Widget buildBodyWidget(List<Service> services) => Padding(
        padding: BaseUtility.all(BaseUtility.paddingNormalValue),
        child: services.isEmpty
            ? CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  200,
                  200,
                ),
                title:
                    '${widget.categoryModel.name} Adına Kayıtlı Bir hizmet bulunamadı!',
                subTitle: 'İsterseniz başka hizmetlere de bakabilirsiniz.',
              )
            : ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final model = services[index];

                  return ServiceCardWidget(
                    dynamicViewExtensions: dynamicViewExtensions,
                    serviceModel: model,
                    serviceAddOnTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      StylistSelectView(
                        salonId: model.salonId,
                        serviceModel: model,
                      ),
                    ),
                  );
                },
              ),
      );
}

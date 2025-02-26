import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salonmate/feature/appointments/appointment_detail/appointment_detail_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/mixin/appointment_mixin.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/normal_text_field.dart';

abstract class AppointmentDetailViewModel
    extends BaseState<AppointmentDetailView> with AppointmentMixin {
  late double ratingValue = 3.0;
  TextEditingController descriptionController = TextEditingController();
  Future<void> updateAppointment(
    Appointment appointment,
    AppointmentsStatus status,
  ) async {
    final token = await getAuthToken();
    if (token != null) {
      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentUpdateEvent(
              token: token,
              status: status,
              appointmentId: appointment.id,
            ),
          );
    } else {
      loggerPrint.printErrorLog('Token is empty');
    }
  }

  void appointmentEvaluation() {
    CodeNoahDialogs(context).showFieldlert(
      'Randevunuzu Değerlendirin!',
      'Randevunuzu puanlayın ve deneyimlerinizi paylaşın.',
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // points
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 4,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                ratingValue = rating;
              },
            ),
            // description
            Padding(
              padding: BaseUtility.top(
                BaseUtility.paddingNormalValue,
              ),
              child: NormalTextFieldWidget(
                controller: descriptionController,
                hintText: 'Description',
                explanationStatus: true,
                onChanged: (val) {},
                isValidator: false,
                enabled: true,
                isLabelText: false,
                dynamicViewExtensions: dynamicViewExtensions,
              ),
            ),
          ],
        ),
      ),
      [
        Row(
          children: <Widget>[
            // close
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: BaseUtility.right(
                  BaseUtility.paddingSmallValue,
                ),
                child: CustomButtonWidget(
                  dynamicViewExtensions: dynamicViewExtensions,
                  text: 'Close',
                  func: () => Navigator.pop(context),
                  btnStatus: ButtonTypes.borderPrimaryColorButton,
                ),
              ),
            ),
            // send
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: BaseUtility.left(
                  BaseUtility.paddingSmallValue,
                ),
                child: CustomButtonWidget(
                  dynamicViewExtensions: dynamicViewExtensions,
                  text: 'Send',
                  func: () => evaluationCreate(),
                  btnStatus: ButtonTypes.primaryColorButton,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> evaluationCreate() async {
    final token = await getAuthToken();
    if (token != null) {
      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentEvaluationCreateEvent(
              token: token,
              appointmentId: widget.appointmentModel.id,
              salonId: widget.appointmentModel.salonId,
              point: ratingValue,
              description: descriptionController.text.isEmpty
                  ? 'null'
                  : descriptionController.text,
            ),
          );
    } else {
      loggerPrint.printInfoLog('Token empty');
    }
  }
}

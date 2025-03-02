import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:salonmate/feature/appointments/appointments_receipt/appointments_receipt_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/util/util.dart';

abstract class AppointmentsReceiptViewModel
    extends BaseState<AppointmentsReceiptView> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  double totalAddService(List<StylistAddServiceModel> selectedServiceDetails) {
    return selectedServiceDetails.fold(
      0.0,
      (sum, service) => sum + (service.price.toDouble()),
    );
  }

  Future<void> loadData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      if (!mounted) return;
      loggerPrint.printErrorLog(
        AppLocalizations.of(context)!.appointment_summary_token_not_avaible,
      );
    }
  }

  Future<void> createAndOpenPdf(
    String customerName,
    int salonPhoneNumber,
    BuildContext contextMain,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.ListView(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Text(
                AppLocalizations.of(contextMain)!.appointment_receipt_title,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 17,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Text(
                AppLocalizations.of(contextMain)!.appointment_receipt_sub_title,
                textAlign: pw.TextAlign.center,
              ),
            ),

            // salon
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_salon,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 6,
                    child: pw.Text(
                      widget.salonDetailModel.name,
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // customer name
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_customer_name,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 3,
                    child: pw.Text(
                      customerName,
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // phone
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_phone,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 6,
                    child: pw.Text(
                      salonPhoneNumber.toString(),
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // booking date
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_booking_date,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 4,
                    child: pw.Text(
                      '${getMonthName(widget.selectDate)}, ${widget.selectDate.day}, ${widget.selectDate.year}',
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // booking time
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_booking_time,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 4,
                    child: pw.Text(
                      '${widget.selectTime.hour.toString().padLeft(2, '0')}:${widget.selectTime.minute.toString().padLeft(2, '0')}',
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // stylist
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_stylist,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 6,
                    child: pw.Text(
                      widget.selectStylistModel.name,
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // service name
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        widget.serviceModel.name,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 4,
                    child: pw.Text(
                      '${widget.serviceModel.price}TL',
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // add service
            ...widget.selectedServiceDetails.map(
              (model) => pw.Padding(
                padding: const pw.EdgeInsets.only(
                  bottom: BaseUtility.paddingNormalValue,
                ),
                child: pw.Row(
                  children: [
                    // title
                    pw.Expanded(
                      child: pw.Center(
                        child: pw.Text(
                          model.name,
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // text
                    pw.Flexible(
                      fit: pw.FlexFit.tight,
                      flex: 4,
                      child: pw.Text(
                        '${model.price}TL',
                        textAlign: pw.TextAlign.right,
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // total price
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                bottom: BaseUtility.paddingNormalValue,
              ),
              child: pw.Row(
                children: [
                  // title
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        AppLocalizations.of(contextMain)!
                            .appointment_receipt_total,
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // text
                  pw.Flexible(
                    fit: pw.FlexFit.tight,
                    flex: 6,
                    child: pw.Text(
                      '${widget.serviceModel.price + totalAddService(widget.selectedServiceDetails)}TL',
                      textAlign: pw.TextAlign.right,
                      style: const pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/receipt.pdf");

    await file.writeAsBytes(await pdf.save());

    await OpenFilex.open(file.path);
  }
}

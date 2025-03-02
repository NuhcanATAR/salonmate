import 'package:salonmate/feature/salons/view/salon_information/salon_information_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SalonInformationViewModel
    extends BaseState<SalonInformationView> {
  Future<void> salonPhoneCall() async {
    if (!await launchUrl(Uri.parse('tel:${widget.salonModel.phone}'))) {
      throw Exception('Could not launch');
    }
  }
}

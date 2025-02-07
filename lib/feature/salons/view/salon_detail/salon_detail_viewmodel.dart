import 'package:provider/provider.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class SalonDetailViewModel extends BaseState<SalonDetailView> {
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      context.read<SalonsBloc>().add(SalonDetailLoadEvent(
            salonId: widget.salonId.toString(),
            token: token,
          ));
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }
}

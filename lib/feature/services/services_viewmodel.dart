import 'package:provider/provider.dart';
import 'package:salonmate/feature/services/bloc/cubit.dart';
import 'package:salonmate/feature/services/bloc/event.dart';
import 'package:salonmate/feature/services/services_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class ServicesViewModel extends BaseState<ServicesView> {
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      context.read<ServicesBloc>().add(
            ServicesLoadedEvent(
              token: token,
              categoryId: widget.categoryId.toString(),
            ),
          );
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }
}

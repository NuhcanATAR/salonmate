import 'package:provider/provider.dart';
import 'package:salonmate/feature/favorite/bloc/cubit.dart';
import 'package:salonmate/feature/favorite/bloc/event.dart' as favorite;
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/event.dart' as salon;
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class SalonDetailViewModel extends BaseState<SalonDetailView> {
  late bool favoriteStatus = true;
  late String valueToken = '';
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      valueToken = token;
      if (!mounted) return;
      context.read<SalonsBloc>().add(
            salon.SalonDetailLoadEvent(
              salonId: widget.salonId.toString(),
              token: token,
            ),
          );
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }

  void favoriteToggle() {
    context.read<SalonsBloc>().add(
          salon.FavoriteToggleEvent(
            salonId: widget.salonId,
            isFavorite: favoriteStatus,
            token: valueToken,
            context: context,
          ),
        );
    loadHomeData();
    context.read<FavoriteBloc>().add(
          favorite.FavoriteSalonsEvent(
            token: valueToken,
          ),
        );
  }
}

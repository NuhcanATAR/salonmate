import 'package:provider/provider.dart';
import 'package:salonmate/feature/favorite/bloc/cubit.dart';
import 'package:salonmate/feature/favorite/bloc/event.dart';
import 'package:salonmate/feature/favorite/favorite_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class FavoriteViewModel extends BaseState<FavoriteView> {
  late bool isFavorite = true;
  late String tokenValue = '';
  @override
  void initState() {
    super.initState();
    getLoaded();
  }

  Future<void> getLoaded() async {
    final token = await getAuthToken();

    if (token != null) {
      tokenValue = token;
      if (!mounted) return;
      context.read<FavoriteBloc>().add(
            FavoriteSalonsEvent(
              token: token,
            ),
          );
    } else {
      loggerPrint.printErrorLog('Token is empty');
    }
  }
}
